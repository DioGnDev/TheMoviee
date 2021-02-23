//
//  DataError.swift
//  iOS Clean Arch
//
//  Created by Ilham Hadi Prabawa on 1/15/21.
//

import Foundation

enum NError: Error {
    case unauthorized
    case internalServerError
    case responseError(message: String)
    case incompleteInput
    case sourceNotFound
    case emptyResult
    case parseError
    case undefinedError
    case connectionProblem
    case invalidUrl(url: String)
}

extension NError {
    var description: String {
        switch self {
        case .unauthorized:
            return "Ups! Your session has been expired. You'll be logged out."
        case .internalServerError:
            return "Internal Server Error, Please try again later."
        case let .responseError(message):
            return message
        case .incompleteInput:
            return "Incomplete input"
        case .undefinedError, .parseError:
            return "Something went wrong"
        case .sourceNotFound:
            return "Sorry Source Not Found"
        case .emptyResult:
            return "Empty Result"
        case .connectionProblem:
            return "Please check your network connection"
        case .invalidUrl(let url):
            return "Invalid URL format: \(url)"
        }
    }
}

class ErrorResponse {
    
    var errorResult: NError?
    
    init(data: Data) {
        self.errorResult = decodeJson(from: data)
    }
    
    private func decodeJson(from data: Data) -> NError{
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
            if let jsonError = json["error"] as? [String: Any] {
                if let message = jsonError["message"] as? String {
                    return .responseError(message: message)
                }
                if let errors = jsonError["errors"] as? String {
                    return .responseError(message: errors)
                }
            }
        }catch let error {
            print(error.localizedDescription)
        }
        
        return .undefinedError
    }
    
}

class DataError: Error {
    
    private (set) var data: Data?
    private (set) var errorModel: ErrorResponse?
    private (set) var errorState: NError
    
    init(data: Data) {
        self.data = data
        self.errorModel = nil
        self.errorState = .undefinedError
    }
    
    init(data: Data? = nil, errorState: NError) {
        self.errorState = errorState
        if let erroData = data {
            self.data = erroData
            self.errorModel = ErrorResponse(data: erroData)
        }
    }
    
    static var unknownError : DataError {
        get {
            return DataError(errorState: .undefinedError)
        }
    }
    
    var errorType: NError {
        get {
            if let _ = data {
                return errorModel?.errorResult ?? .undefinedError
            }else {
                return errorState
            }
        }
    }
    
}
