//
//  GetTrailerUsecase.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import Foundation

class GetTrailerUsecase: BaseUsecase {
    typealias T = [TrailerEntity]
    typealias P = TrailerRequest
    typealias E = DataError
    
    //repository
    let repository: DetailMovieRepositoryLogic
    
    init(repository: DetailMovieRepositoryLogic) {
        self.repository = repository
    }
    
    func execute(param: TrailerRequest, completion: @escaping (Result<[TrailerEntity], DataError>) -> Void) {
        repository.getTrailer(parameter: param.toParam(), completion: completion)
    }
    
}


final class TrailerRequest: BaseRequest {
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    override func toParam() -> [String : Any] {
        return ["id": id,
                "api_key": apiKey,
                "language": language]
    }
}
