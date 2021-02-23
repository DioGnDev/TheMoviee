//
//  DetailMovieUIState.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import Foundation

class DetailMovieUIState {
    
    var id: Int
    var viewModel: DetailMovieViewModel
    
    init() {
        self.id = -1
        self.viewModel = .init(
            entity: .init(id: 1,
                          title: "Test",
                          description: "Test",
                          poster: "Test",
                          popularity: 1,
                          status: "Test"))
        
    }
}
