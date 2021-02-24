//
//  ReviewUI+TableView.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/25/21.
//

import Foundation
import UIKit

extension ReviewUI: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as! ReviewTableViewCell
        setupReview(for: cell, at: indexPath)
        return cell
    }
    
}

extension ReviewUI {
    
    func setupReview(for cell: ReviewTableViewCell, at indexPath: IndexPath) {
        let review = state.reviews[indexPath.item]
        cell.titleLabel.text = review.author
        cell.ratingLabel.text = review.rating
        cell.contentLabel.text = review.content
        loadImage(from: review.avatar, into: cell.avatarImageView)
    }
}
