//
//  DiscoverCell.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import UIKit

class DiscoverCell: UITableViewCell {

    static let identifier = "discover_cell"
    static let nib = UINib(nibName: "\(DiscoverCell.self)", bundle: nil)
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var adultStatus: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
}

