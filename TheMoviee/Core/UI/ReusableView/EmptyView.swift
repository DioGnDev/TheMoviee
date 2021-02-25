//
//  EmptyView.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/25/21.
//

import Foundation
import LBTATools
import UIKit
import Lottie

class EmptyView: UIView {
    
    var iconName: String
    var message: String

    private var emptyIcon: AnimationView?
    private var emptyLabel = UILabel(text: "", font: .systemFont(ofSize: 14), textColor: .black, textAlignment: .center, numberOfLines: 0)
    
    init(iconName: String, message: String) {
        self.iconName = iconName
        self.message = message
        
        super.init(frame: .zero)
        
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView(){
        
        emptyIcon = .init(name: iconName)
        emptyIcon!.loopMode = .loop
        emptyIcon!.animationSpeed = 0.5
        emptyIcon!.contentMode = .scaleAspectFit
        emptyLabel.text = message
        
        addSubview(emptyIcon!)
        addSubview(emptyLabel)
        
        emptyIcon!.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 150, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 200))
        emptyIcon!.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emptyLabel.anchor(top: emptyIcon!.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        emptyIcon!.play()
        
    }
    
}
