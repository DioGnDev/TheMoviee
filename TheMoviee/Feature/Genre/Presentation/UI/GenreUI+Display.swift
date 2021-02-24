//
//  GenreUI+Display.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation
import SkeletonView

extension GenreUI: GenreDisplayLogic {
    
    func displayGenre(viewModel: [GenreViewModel]){
        state.update(genres: viewModel)
        genreTableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
    }
    
    func displayAlert(with message: String) {
        self.alertView(title: "Oopps", message: message)
    }
}
