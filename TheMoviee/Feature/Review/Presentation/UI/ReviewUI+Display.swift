//
//  ReviewUI+Display.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/25/21.
//

import Foundation

extension ReviewUI: ReviewDisplayLogic {
    
    func displayReview(viewModel: [ReviewViewModel]){
        state.update(reviews: viewModel)
        self.reviewTableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
    }
    
    func displayMoreReview(viewModels: [ReviewViewModel]) {
        state.shouldLoading(false)
        state.insert(reviews: viewModels)
        self.reviewTableView.reloadData()
    }
    
    func displayAlert(with message: String) {
        self.alertView(title: "Oops", message: message)
    }
    
    func displayEmptyView(with iconName: String, message: String, detail: String) {
        
    }
}
