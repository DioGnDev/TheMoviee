//
//  DiscoverUI+Display.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation

extension DiscoverUI: DiscoverDisplayLogic {
    
    func displayDiscover(viewModels: [DiscoverViewModel]){
        state.update(discover: viewModels)
        self.discoverTableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.5))
    }
    
    func displayDiscoverMore(viewModels: [DiscoverViewModel]) {
        state.shouldLoading(false)
        state.insert(discover: viewModels)
        self.discoverTableView.reloadData()
    }
    
    func displayAlert(with message: String) {
        self.alertView(title: "Oops", message: message)
    }
}
