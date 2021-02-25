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
    private(set) var discovers: [DiscoverViewModel]
    private(set) var isLoadingMore = false
    
    init() {
        self.titleName = ""
        self.genreId = -1
        self.discovers = []
        self.page = 0
    }
    
    var totalPages = UserDefaults.standard.integer(forKey: Constant.TOTAL_DISCOVER_PAGES)
    
    var isLastPage: Bool {
        return self.page == totalPages
    }
    
    func update(discover viewModels: [DiscoverViewModel]){
        self.discovers = viewModels
    }
    
    func insert(discover viewModels: [DiscoverViewModel]) {
        self.discovers.append(contentsOf: viewModels)
    }
    
    func shouldLoading(_ loading: Bool){
        self.isLoadingMore = loading
    }
    
    func update(page: Int) {
        self.page = page
    }
}
