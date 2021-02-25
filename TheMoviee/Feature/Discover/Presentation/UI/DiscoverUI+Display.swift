//
//  DiscoverUI+Display.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation

extension DiscoverUI: DiscoverDisplayLogic {
    
    func displayDiscover(viewModels: [DiscoverViewModel]){
        refreshControl.endRefreshing()
        discoverTableView.restore()
        state.update(discover: viewModels)
        discoverTableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.5))
    }
    
    func displayMoreDiscover(viewModels: [DiscoverViewModel]) {
        refreshControl.endRefreshing()
        discoverTableView.restore()
        state.shouldLoading(false)
        state.insert(discover: viewModels)
        discoverTableView.reloadData()
    }
    
    func displayAlert(with message: String) {
        refreshControl.endRefreshing()
        alertView(title: "Oops", message: message)
    }
    
    func displayEmptyView(with iconName: String, message: String, detail: String) {
        refreshControl.endRefreshing()
        discoverTableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.5))
        discoverTableView.setEmptyView(with: "empty-box", message: "Oops \(message)")
    }
}
