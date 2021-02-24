//
//  File.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation

class DiscoverUIState {
    
    var titleName: String
    var genreId: Int
    private(set) var viewModels: [DiscoverViewModel]
    
    init() {
        titleName = ""
        genreId = -1
        viewModels = []
    }
    
    func update(discover viewModels: [DiscoverViewModel]){
        self.viewModels = viewModels
    }
}
