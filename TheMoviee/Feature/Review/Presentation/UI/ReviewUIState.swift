//
//  ReviewUIState.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/25/21.
//

import Foundation

class ReviewUIState {
    
    var id: Int
    private(set) var reviews: [ReviewViewModel]
    private(set) var isLoadingMore = false
    private(set) var page: Int
    
    init() {
        self.id = -1
        self.reviews = []
        self.page = 0
    }
    
    var totalPages = UserDefaults.standard.integer(forKey: Constant.TOTAL_REVIEW_PAGES)
    
    var isLastPage: Bool {
        return self.page == totalPages
    }
    
    func update(reviews: [ReviewViewModel]) {
        self.reviews = reviews
    }
    
    func insert(reviews viewModels: [ReviewViewModel]) {
        self.reviews.append(contentsOf: viewModels)
    }
    
    func shouldLoading(_ loading: Bool){
        self.isLoadingMore = loading
    }
    
    func update(page: Int) {
        self.page = page
    }
}
