//
//  DetailMovieUI+Display.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import Foundation

extension DetailMovieUI: DetailMovieDisplayLogic {
    
    func displayDetailMovie(viewModel: DetailMovieViewModel){
        state.update(detail: viewModel)
        detailCollectionView.reloadSections(IndexSet(integer: 0))
    }
    
    func displayReview(viewModels: [ReviewViewModel]) {
        state.update(reviews: viewModels)
        detailCollectionView.reloadSections(IndexSet(integer: 2))
    }
    
    func displayTrailer(viewModels: [TrailerViewModel]) {
        state.update(trailers: viewModels)
        detailCollectionView.reloadSections(IndexSet(integer: 1))
    }
}
