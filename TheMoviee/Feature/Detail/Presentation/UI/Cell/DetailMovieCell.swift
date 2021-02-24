//
//  DetailMovieCell.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import UIKit

class DetailMovieCell: UICollectionViewCell {
    
    static let identifier = "detail_movie_cell"
    static let nib = UINib(nibName: "\(DetailMovieCell.self)", bundle: nil)

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
