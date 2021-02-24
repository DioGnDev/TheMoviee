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
    
    init() {
        id = -1
        reviews = []
    }

    func update(reviews: [ReviewViewModel]) {
        self.reviews = reviews
    }

}
