//
//  TrailerCell.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import UIKit

class TrailerCell: UICollectionViewCell {

    static let identifier = "trailer_cell"
    static let nib = UINib(nibName: "\(TrailerCell.self)", bundle: nil)
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        visualEffectView.layer.cornerRadius = 14
        visualEffectView.layer.masksToBounds = true
    }

    @IBAction func didPlay(_ sender: UIButton) {
        debug(with: "action", message: "play trailer")
    }
}
