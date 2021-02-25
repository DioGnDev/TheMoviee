//
//  DiscoverRepositoryImpl.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//

import Foundation

class DiscoverRepositoryImpl: DiscoverRepositoryLogic {
    
    let userDefault = UserDefaults.standard
    
    private let datasource: DiscoverRemoteDataSource
    
    init(datasource: DiscoverRemoteDataSource) {
        self.datasource = datasource
    }
    
    func getDiscover(parameter: [String : Any],
                     completion: @escaping (Result<[DiscoverEntity], DataError>) -> Void) {
        
        datasource.fetchDiscover(param: parameter) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let models):
                
                let totalPages = models.totalPages ?? -1
                self.userDefault.setValue(totalPages, forKey: Constant.TOTAL_DISCOVER_PAGES)
            
                let entities = models.results?
                    .map {
                        DiscoverEntity(id: $0.id ?? -1,
                                       title: $0.originalTitle ?? "",
                                       description: $0.overview ?? "",
                                       poster: $0.posterPath ?? "",
                                       popularity: $0.popularity ?? 0.0,
                                       adult: $0.adult ?? false,
                                       releaseDate: $0.releaseDate ?? "1928")
                    }
                
                completion(.success(entities ?? []))
            }
        }
    }
    
}
