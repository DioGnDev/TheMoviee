//
//  GenreUIState.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation

class GenreUIState {
    private(set) var viewModels: [GenreViewModel]
    
    init() {
        viewModels = []
    }
    
    func update(genres viewModels: [GenreViewModel]) {
        self.viewModels = viewModels
    }
}
