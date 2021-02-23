//
//  BaseDisplayLogic.swift
//  Osvas-iOS
//
//  Created by Ilham Hadi Prabawa on 1/20/21.
//  Copyright © 2021 Osvas. All rights reserved.
//

import Foundation

protocol BaseDisplayLogic: class {
    func displayLoading()
    func displayLoading(with message: String)
    func displayAlert(with message: String)
    func displayEmptyView(with iconName: String,
                          message: String,
                          detail: String)
}

extension BaseDisplayLogic {
    
    func displayLoading() { }
    
    func displayLoading(with message: String) { }
    
    func displayAlert(with message: String) { }
    
    func displayEmptyView(with iconName: String,
                          message: String,
                          detail: String) { }
    
}
