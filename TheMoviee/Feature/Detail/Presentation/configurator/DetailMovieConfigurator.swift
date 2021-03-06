//
//  DetailMovieConfigurator.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS.
//
//

import Foundation

class DetailMovieConfigurator {
    
    static func inject(dependencyFor viewController: DetailMovieUI) {
        let router = DetailMovieRouter()
        let presenter = DetailMoviePresenter()
        
        let dataSource = DetailMovieRemoteDataSourceImpl()
        let repository = DetailMovieRepositoryImpl(datasource: dataSource)
        let usecase = GetDetailMovieUsecase(repository: repository)
        let reviewUsecase = GetSampleReviewUsecase(repository: repository)
        let trailerUsecase = GetTrailerUsecase(repository: repository)
        
        let interactor = DetailMovieInteractor(getDetailMovieUsecase: usecase,
                                               reviewUsecase: reviewUsecase,
                                               getTrailerUsecase: trailerUsecase)
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
    }
}
