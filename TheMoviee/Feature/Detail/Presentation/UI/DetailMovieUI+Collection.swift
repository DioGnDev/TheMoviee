//
//  DetailMovieUI+Collection.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import Foundation
import UIKit

extension DetailMovieUI: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return [1, state.trailerViewModels.count, state.reviewViewModels.count][section]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailMovieCell.identifier, for: indexPath) as! DetailMovieCell
            setupDetail(for: cell)
            return cell
        }else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrailerCell.identifier, for: indexPath) as! TrailerCell
            cell.delegate = self
            setupTrailer(for: cell, at: indexPath)
            return cell
        }else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCell.identifier, for: indexPath) as! ReviewCell
            setupReview(for: cell, at: indexPath)
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "default_cell", for: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: BasicHeader.kind, withReuseIdentifier: BasicHeader.identifier, for: indexPath) as! BasicHeader
        header.delegate = self
        
        switch indexPath.section {
        case 1:
            header.titleLabel.text = "Trailer"
            header.showAllButton.isHidden = true
        case 2:
            header.titleLabel.text = "Reviews"
            header.showAllButton.isHidden = false
        default:
            header.titleLabel.text = ""
            header.showAllButton.isHidden = true
        }
        
        return header
    }
}

extension DetailMovieUI {
    
    func setupDetail(for cell: DetailMovieCell) {
        cell.titleLabel.text = state.detailViewModel.title
        cell.descriptionLabel.text = state.detailViewModel.description
        cell.popularityLabel.text  = state.detailViewModel.popularity
        cell.statusLabel.text = state.detailViewModel.status
        cell.releaseDateLabel.text = state.detailViewModel.releaseDate
        loadImage(from: state.detailViewModel.poster, into: cell.posterImageView)
    }
    
    func setupTrailer(for cell: TrailerCell, at index: IndexPath) {
        let item = state.trailerViewModels[index.row]
        state.set(video: item.videoUrl)
        cell.trailerLabel.text = item.title
    }
    
    func setupReview(for cell: ReviewCell, at index: IndexPath) {
        let review = state.reviewViewModels[index.row]
        cell.authorLabel.text = review.author
        cell.ratingLabel.text = review.rating
        cell.contentLabel.text = review.content
        loadImage(from: review.avatar, into: cell.avatarImageView)
    }
}
