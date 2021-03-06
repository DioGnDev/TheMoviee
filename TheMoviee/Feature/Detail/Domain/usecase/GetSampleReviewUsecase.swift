//
//  ReviewUsecase.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import Foundation

class GetSampleReviewUsecase: BaseUsecase {
    typealias T = [ReviewEntity]
    typealias P = ReviewRequest
    typealias E = DataError
    
    let repository: DetailMovieRepositoryLogic
    
    init(repository: DetailMovieRepositoryLogic) {
        self.repository = repository
    }
    
    func execute(param: ReviewRequest, completion: @escaping (Result<[ReviewEntity], DataError>) -> Void) {
        repository.getReview(parameter: param.toParam(), completion: completion)
    }
    
}

class ReviewRequest: BaseRequest {
    
    let id: Int
    let page: Int
    
    init(id: Int, page: Int) {
        self.id = id
        self.page = page
    }
    
    override func toParam() -> [String : Any] {
        return ["api_key": apiKey,
                "id": id,
                "page": page]
    }
    
}
