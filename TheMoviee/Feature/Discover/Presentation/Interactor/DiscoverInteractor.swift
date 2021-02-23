//
//  DiscoverInteractor.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Xcode Templates
//
//

import Foundation

protocol DiscoverInteractorLogic {
    func getDiscover(param: DiscoverRequest)
}

class DiscoverInteractor: DiscoverInteractorLogic {
    
    //presenter
    var presenter: DiscoverPresenterLogic?
    
    //usecase
    var getDiscoverUsecase: GetDiscoverUsecase
    
    //initial
    init(getDiscoverUsecase: GetDiscoverUsecase) {
        self.getDiscoverUsecase = getDiscoverUsecase
    }
    
    //example method 
    func getDiscover(param: DiscoverRequest) {
        
        getDiscoverUsecase.execute(param: param) { (result) in
            switch result {
            case .failure(let error):
                //present error to view
                self.presenter?.presentAlert(with: error.errorType.description)
                break
            case .success(let items):
                if items.count == 0 || items.isEmpty {
                    //present empty view
                }else {
                    self.presenter?.presentDiscover(entities: items)
                }
                break
            }
        }
    }
    
}
