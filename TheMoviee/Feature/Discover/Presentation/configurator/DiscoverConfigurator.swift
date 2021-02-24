//
//  DiscoverConfigurator.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS.
//
//

import Foundation

class DiscoverConfigurator {
    
    static func inject(dependencyFor viewController: DiscoverUI) {
        let router = DiscoverRouter()
        let presenter = DiscoverPresenter()
        
        let dataSource = DiscoverRemoteDataSourceImpl()
        let repository = DiscoverRepositoryImpl(datasource: dataSource)
        let usecase = GetDiscoverUsecase(repository: repository)

        let interactor = DiscoverInteractor(getDiscoverUsecase: usecase)
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
    }
}
