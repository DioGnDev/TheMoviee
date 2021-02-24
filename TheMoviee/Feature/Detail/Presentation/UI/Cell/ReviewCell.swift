//
//  ReviewCell.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    static let identifier = "review_cell"
    static let nib = UINib(nibName: "\(ReviewCell.self)", bundle: nil)

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 14
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }

}
