//
//  BaseViewController.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    var controllerName: String = ""{
        didSet{
            debug(with: "currentVC", message: controllerName)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.isSkeletonable = true
        self.view.backgroundColor = .white
        
        setupView()
    }
    
    func setupView(){ }
    
    deinit {
        debug(with: "deinit", message: controllerName)
    }

}
