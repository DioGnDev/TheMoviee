//
//  ReviewInteractor.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Xcode Templates
//
//

import Foundation

protocol ReviewInteractorLogic {
    func getReview(param: ReviewRequest)
    func getMoreReview(param: ReviewRequest)
}

class ReviewInteractor: ReviewInteractorLogic {
    
    //presenter
    var presenter: ReviewPresenterLogic?
    
    //usecase
    var getReviewUsecase: GetReviewUsecase
    
    //initial
    init(getReviewUsecase: GetReviewUsecase) {
        self.getReviewUsecase = getReviewUsecase
    }
    
    func getReview(param: ReviewRequest) {
        
        getReviewUsecase.execute(param: param) { (result) in
            switch result {
            case .failure(let error):
                self.presenter?.presentAlert(with: error.errorState.description)
                break
            case .success(let items):
                if items.count == 0 || items.isEmpty {
                    self.presenter?.presentEmpty(with: "", message: "No Review", detail: "Review not found")
                }else {
                    self.presenter?.presentReview(entities: items)
                }
                break
            }
        }
    }
    
    func getMoreReview(param: ReviewRequest) {
        
        getReviewUsecase.execute(param: param) { (result) in
            switch result {
            case .failure(let error):
                self.presenter?.presentAlert(with: error.errorState.description)
                break
            case .success(let items):
                if items.count == 0 || items.isEmpty {
                    self.presenter?.presentEmpty(with: "", message: "No Review", detail: "Review not found")
                }else {
                    self.presenter?.presentMoreReview(entities: items)
                }
                break
            }
        }
    }
    
}
