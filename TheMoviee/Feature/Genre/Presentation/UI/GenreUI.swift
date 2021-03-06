//
//  GenreUI.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//

import Foundation
import UIKit

protocol GenreDisplayLogic: BaseDisplayLogic{
    func displayGenre(viewModel: [GenreViewModel])
}

class GenreUI: BaseViewController{
    
    //dependency
    var interactor: GenreInteractorLogic?
    var router: GenreRouterLogic?
    
    //state
    let state = GenreUIState()
    
    //view
    @IBOutlet weak var genreTableView: UITableView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        GenreConfigurator.inject(dependencyFor: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        GenreConfigurator.inject(dependencyFor: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        controllerName = "\(GenreUI.self)"
        
        genreTableView.showAnimatedGradientSkeleton()
        
        let param = GenreRequest()
        interactor?.getGenre(param: param)
    }
    
    override func setupView() {
        super.setupView()
        
        genreTableView.rowHeight = UITableView.automaticDimension
        genreTableView.dataSource = self
        genreTableView.delegate = self
        genreTableView.separatorStyle = .none
        genreTableView.register(GenreTableViewCell.nib, forCellReuseIdentifier: GenreTableViewCell.identifier)
    }
    
}
