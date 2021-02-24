//
//  BasePresenterLogic.swift
//  Osvas-iOS
//
//  Created by Ilham Hadi Prabawa on 1/20/21.
//  Copyright © 2021 Osvas. All rights reserved.
//

import Foundation

protocol BasePresenterLogic {
    func presentLoading()
    func presentLoading(with message: String)
    func presentAlert(with message: String)
    func presentEmpty(with iconName: String, message: String, detail: String)
}

extension BasePresenterLogic {
    func presentLoading() {}
    func presentLoading(with message: String) {}
    func presentAlert(with message: String) {}
    func presentEmpty(with iconName: String, message: String, detail: String) {}
}
