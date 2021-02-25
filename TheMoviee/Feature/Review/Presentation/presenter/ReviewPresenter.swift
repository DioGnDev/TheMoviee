//
//  ReviewPresenter.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS.
//

import Foundation

protocol ReviewPresenterLogic: BasePresenterLogic {
    func presentReview(entities: [ReviewEntity])
    func presentMoreReview(entities: [ReviewEntity])
}

class ReviewPresenter: ReviewPresenterLogic {
    
    weak var viewController: ReviewDisplayLogic?
    
    func presentReview(entities: [ReviewEntity]) {
        let viewModel = entities.map(ReviewViewModel.init)
        viewController?.displayReview(viewModel: viewModel)
    }
    
    func presentAlert(with message: String) {
        viewController?.displayAlert(with: message)
    }
    
    func presentEmpty(with iconName: String, message: String, detail: String) {
        viewController?.displayEmptyView(with: iconName, message: message, detail: detail)
    }
    
    func presentMoreReview(entities: [ReviewEntity]) {
        let viewModels = entities.map(ReviewViewModel.init)
        viewController?.displayMoreReview(viewModels: viewModels)
    }
}

class ReviewViewModel {
    
    private let entity: ReviewEntity
    
    init(entity: ReviewEntity) {
        self.entity = entity
    }
    
    var review: ReviewEntity {
        return entity
    }
    
    var author: String {
        return "Author: \(entity.author)"
    }
    
    var rating: String {
        return "Rating: \(entity.rating)"
    }
    
    var username: String {
        return  "Username: \(entity.username)"
    }
    
    var content: String {
        return entity.content
    }
    
    var avatar: URL {
        return URL(string: "https://secure.gravatar.com/avatar\(entity.avatar)") ?? URL(fileURLWithPath: "")
    }
    
}
