//
//  BasicHeader.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import UIKit

protocol BasicHeaderDelegate: class {
    func didTapShowAll()
}

class BasicHeader: UICollectionReusableView {

    static let identifier = "header"
    static let nib = UINib(nibName: "\(BasicHeader.self)", bundle: nil)
    static let kind = "header"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var showAllButton: UIButton!
    
    weak var delegate: BasicHeaderDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        showAllButton.isHidden = true
    }
    
    @IBAction func didShowAll(_ sender: UIButton) {
        delegate?.didTapShowAll()
    }
    
}
