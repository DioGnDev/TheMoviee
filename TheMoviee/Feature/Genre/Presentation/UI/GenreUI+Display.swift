//
//  GenreUI+Display.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation

extension GenreUI: GenreDisplayLogic {
    
    func displayGenre(viewModel: [GenreViewModel]){
        self.view.hideSkeleton()
        state.update(genres: viewModel)
        genreTableView.reloadData()
    }
    
    func displayAlert(with message: String) {
        self.alertView(title: "Oopps", message: message)
    }
}
