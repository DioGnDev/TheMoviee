//
//  GenreUsecase.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//

import Foundation

class GetGenreUsecase: BaseUsecase {
    
    typealias T = [GenreEntity]
    typealias P = GenreRequest
    typealias E = DataError
    
    //repository
    let repository: GenreRepositoryLogic
    
    init(repository: GenreRepositoryLogic) {
        self.repository = repository
    }
    
    func execute(param: GenreRequest,
                 completion: @escaping (Result<[GenreEntity], DataError>) -> Void) {
        
        repository.getGenre(parameter: param.toParam()) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let entities):
                completion(.success(entities))
                break
            }
        }
    }
}

class GenreRequest: BaseRequest {
    
    override func toParam() -> [String : Any] {
        return ["api_key": apiKey,
                "language": language]
    }
}
