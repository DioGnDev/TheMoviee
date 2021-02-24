//
//  DiscoverUI+Display.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation

extension DiscoverUI: DiscoverDisplayLogic {
    
    func displayDiscover(viewModel: [DiscoverViewModel]){
        state.update(discover: viewModel)
        self.discoverTableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.5))
    }
    
    func displayAlert(with message: String) {
        self.alertView(title: "Oops", message: message)
    }
}
