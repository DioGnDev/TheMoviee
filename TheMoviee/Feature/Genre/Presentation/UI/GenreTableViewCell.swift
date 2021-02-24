//
//  GenreTableViewCell.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/25/21.
//

import UIKit

class GenreTableViewCell: UITableViewCell {

    static let identifier = "genre_cell"
    static let nib = UINib(nibName: "\(GenreTableViewCell.self)", bundle: nil)
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
