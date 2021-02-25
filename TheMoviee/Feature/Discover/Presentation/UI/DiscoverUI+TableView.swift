//
//  DiscoverUI+TableView.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation
import UIKit
import Nuke

extension DiscoverUI: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let size = state.discovers.count
        let threshold = 2
        
        if size == 0 || size < threshold { return }
        
        if indexPath.item == size - threshold {
            if !state.isLoadingMore && !state.isLastPage {
                state.shouldLoading(true)
                state.update(page: state.page + 1)
                let request = DiscoverRequest(genreId: state.genreId, page: state.page)
                interactor?.getMoreDiscover(param: request)
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.discovers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverCell.identifier, for: indexPath) as! DiscoverCell
        setupData(for: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = state.discovers[indexPath.item]
        router?.navigateToDetailMovie(with: item.getEntity)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DiscoverUI {
    
    func setupData(for cell: DiscoverCell, indexPath: IndexPath) {
        let item = state.discovers[indexPath.row]
        cell.titleLabel.text = item.getName
        cell.descriptionLabel.text = item.getDescription
        cell.adultStatus.text = item.status
        cell.releaseLabel.text = item.year
        cell.popularityLabel.text = item.popularity
        let options = ImageLoadingOptions(transition: .fadeIn(duration: 0.2))
        Nuke.loadImage(with: item.imageURL!, options: options, into: cell.thumbnailImageView)
    }
    
}
