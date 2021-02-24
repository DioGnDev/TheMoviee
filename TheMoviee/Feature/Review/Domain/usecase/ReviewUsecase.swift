//
//  ReviewUsecase.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//

import Foundation

class GetReviewUsecase: BaseUsecase {
    
    typealias T = [ReviewEntity]
    typealias P = ReviewRequest
    typealias E = DataError
    
    //repository
    let repository: ReviewRepositoryLogic
    
    init(repository: ReviewRepositoryLogic) {
        self.repository = repository
    }
    
    func execute(param: ReviewRequest,
                 completion: @escaping (Result<[ReviewEntity], DataError>) -> Void) {
        
        repository.getReview(parameter: param.toParam(), completion: completion)
    }
}
