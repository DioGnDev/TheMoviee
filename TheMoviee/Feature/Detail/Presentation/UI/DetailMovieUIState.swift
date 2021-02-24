//
//  DetailMovieUIState.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import Foundation

class DetailMovieUIState {
    
    var id: Int
    private(set) var detailViewModel: DetailMovieViewModel
    private(set) var reviewViewModels: [ReviewViewModel]
    private(set) var trailerViewModels: [TrailerViewModel]
    
    init() {
        self.id = -1
        trailerViewModels = []
        reviewViewModels = []
        self.detailViewModel = .init(
            entity: .init(id: 1,
                          title: "Test",
                          description: "Test",
                          poster: "Test",
                          popularity: 1,
                          status: "Test",
                          releaseDate: "1733"))
        
    }
    
    func update(detail: DetailMovieViewModel) {
        self.detailViewModel = detail
    }
    
    func update(reviews: [ReviewViewModel]) {
        self.reviewViewModels = reviews
    }
    
    func update(trailers: [TrailerViewModel]) {
        self.trailerViewModels = trailers
    }
}
