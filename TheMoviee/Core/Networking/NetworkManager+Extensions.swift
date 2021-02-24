//
//  NetworkManager+Extensions.swift
//  Osvas-iOS
//
//  Created by Ilham Hadi Prabawa on 1/20/21.
//  Copyright © 2021 Osvas. All rights reserved.
//

import Foundation
import Alamofire

extension NetworkManager {
    
    func parsingJSON(from data: Data) -> Result<Data, DataError>{
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
            
            if let jsonData = json["data"] as? [String: Any] {
                let jsonData = try JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted)
                return .success(jsonData)
            }
            
            if let jsonData = json["data"] as? String {
                ///create json dictionary if data just a string
                let jsonDict = ["message": jsonData]
                let jsonData = try JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted)
                return .success(jsonData)
            }
            
        } catch let error {
            debug(with: "error", message: error.localizedDescription)
        }
        
        return .failure(DataError(errorState: .parseError))
    }
    
    func decodeMessage(data: Data, completion: @escaping(String) -> ()){
        do {
            let decode = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let json = decode as? [String: Any] {
                if let message = json["message"] as? String {
                    completion(message)
                }
            }
        } catch {
            fatalError("error banget")
        }
    }
}

extension NetworkManager {
    
    func request(with url: String,
                 withMethod method: HTTPMethod? = .get,
                 withHeaders headers: HTTPHeaders = [:],
                 withParameter parameters: Parameters = [:],
                 withEncoding encoding: ParameterEncoding? = URLEncoding.default,
                 completion: @escaping(Result<Data, DataError>) -> Void) {
        
        AF.request(Environment.baseURL.appending(url),
                   method: method ?? .get,
                   parameters: parameters,
                   encoding: encoding ?? URLEncoding.default,
                   headers: headers)
            .responseString(queue: DispatchQueue.main, encoding: String.Encoding.utf8, completionHandler: { (response) in
                
                //Log
                /*debug(with: "url", message: String(describing: response.request))
                debug(with: "header", message: String(describing: headers))
                debug(with: "params", message: String(describing: parameters))
                debug(with: "statuscode", message: String(describing: response.response?.statusCode))
                debug(with: "response", message: response.result)*/
                
                guard let statusCode = response.response?.statusCode else {
                    completion(.failure(DataError.unknownError))
                    return
                }
                
                if 200 ... 299 ~= statusCode  {
                    //success
                    guard let data = response.data else {
                        completion(.failure(DataError.unknownError))
                        return
                    }
                    completion(.success(data))
                    
                } else if statusCode == 401 {
                    let error = DataError(errorState: .unauthorized)
                    completion(.failure(error))
                    
                } else if statusCode == 404 {
                    let err = DataError(errorState: .sourceNotFound)
                    completion(.failure(err))
                    
                } else if statusCode == 500 {
                    ///internal server error
                    let error = DataError(errorState: .internalServerError)
                    completion(.failure(error))
                    
                } else {
                    /// throw unknown error
                    completion(.failure(DataError.unknownError))
                    
                }
            })
    }
}

extension NetworkManager {
    
    //alamofire upload file
    func uploadFile(with url: String,
                    withMethod method: HTTPMethod? = .get,
                    withHeaders headers: HTTPHeaders,
                    withParameter parameters: [String: String] = [:],
                    withEncoding encoding: ParameterEncoding? = URLEncoding.default,
                    media: Media?,
                    completion: @escaping(Result<Data, DataError>) -> Void){
        
        AF.upload(multipartFormData: { (multipart) in
            
            for (key, value) in parameters {
                multipart.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
            
            if let media = media{
                multipart.append(media.data, withName: media.key, fileName: media.filename, mimeType: media.mimeType)
            }
            
        },
        to: Environment.baseURL.appending(url), method: .post, headers: headers)
        .responseString { (response) in
            //Log
            debug(with: "url", message: String(describing: response.request))
            debug(with: "header", message: String(describing: headers))
            debug(with: "params", message: String(describing: parameters))
            debug(with: "statuscode", message: String(describing: response.response?.statusCode))
            debug(with: "response", message: String(describing: response.result))
            debug(with: "body", message: String(describing: response.request))
        }
    }
}

extension NetworkManager {
    func loadJSONFromFile(with filename: String, completion: @escaping(Result<Data, DataError>) -> Void) {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let rawData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                completion(parsingJSON(from: rawData))
            }catch {
                debug(with: "Error", message: error)
                completion(.failure(DataError(errorState: .parseError)))
            }
        }else {
            completion(.failure(DataError(errorState: .sourceNotFound)))
        }
    }
}

