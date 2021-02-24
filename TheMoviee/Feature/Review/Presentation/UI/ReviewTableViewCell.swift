//
//  ReviewTableViewCell.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/25/21.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    static let identifier = "review_cell"
    static let nib = UINib(nibName: "\(ReviewTableViewCell.self)", bundle: nil)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
