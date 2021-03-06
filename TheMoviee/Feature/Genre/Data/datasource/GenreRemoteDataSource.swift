//
//  GenreRemoteDataSource.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//

import Foundation

protocol GenreRemoteDataSource {
    
    func fetchGenre(param: [String: Any],
                    completion: @escaping(Result<[GenreModel], DataError>) -> Void)
    
}

class GenreRemoteDataSourceImpl: GenreRemoteDataSource{
    
    func fetchGenre(param: [String : Any],
                    completion: @escaping (Result<[GenreModel], DataError>) -> Void) {
        
        let endpoint = "/genre/movie/list"
        NetworkManager.shared.request(with: endpoint, withMethod: .get, withParameter: param) { (result) in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(data):
                do {
                    let json = try JSONDecoder().decode(GenreResponse.self, from: data)
                    completion(.success(json.genres))
                } catch {
                    completion(.failure(.init(errorState: .parseError)))
                }
            }
        }
        
    }
    
}
