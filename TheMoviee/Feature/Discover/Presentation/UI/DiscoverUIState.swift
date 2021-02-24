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
    private(set) var page: Int
    private(set) var viewModels: [DiscoverViewModel]
    private(set) var isLoadingMore = false
    
    init() {
        self.titleName = ""
        self.genreId = -1
        self.viewModels = []
        self.page = 0
    }
    
    func update(discover viewModels: [DiscoverViewModel]){
        self.viewModels = viewModels
    }
    
    func insert(discover viewModels: [DiscoverViewModel]) {
        self.viewModels.append(contentsOf: viewModels)
    }
    
    func shouldLoading(_ loading: Bool){
        self.isLoadingMore = loading
    }
    
    func update(page: Int) {
        self.page = page
    }
}
