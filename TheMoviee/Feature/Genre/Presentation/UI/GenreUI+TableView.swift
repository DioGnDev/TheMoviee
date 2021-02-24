//
//  GenreUI+TableView.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation
import UIKit

extension GenreUI: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewmodel = state.viewModels[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: GenreTableViewCell.identifier, for: indexPath) as! GenreTableViewCell
        cell.backgroundColor = indexPath.row % 2 == 0 ? .systemGray6 : .white
        cell.nameLabel.text = viewmodel.getName
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = state.viewModels[indexPath.item]
        router?.navigateToDiscover(with: item.getEntity)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
