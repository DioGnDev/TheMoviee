//
//  DetailMovieRepositoryImpl.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//

import Foundation

class DetailMovieRepositoryImpl: DetailMovieRepositoryLogic {
    
    private let datasource: DetailMovieRemoteDataSource
    
    init(datasource: DetailMovieRemoteDataSource) {
        self.datasource = datasource
    }
    
    func getDetailMovie(parameter: [String : Any],
                        completion: @escaping (Result<DetailMovieEntity, DataError>) -> Void) {
        
        datasource.fetchDetailMovie(param: parameter) { result in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(model):
                let entity = DetailMovieEntity(id: model.id ?? -1,
                                               title: model.title ?? "",
                                               description: model.overview ?? "",
                                               poster: model.posterPath ?? "",
                                               popularity: model.popularity ?? 0.0,
                                               status: model.status ?? "",
                                               releaseDate: model.releaseDate ?? "1826")
                completion(.success(entity))
            }
        }
    }
    
    func getReview(parameter: [String : Any], completion: @escaping (Result<[ReviewEntity], DataError>) -> Void) {
        
        datasource.fetchReview(param: parameter) { result in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(models):
                let entities = models.map {
                    ReviewEntity(author: $0.author ?? "",
                                 username: $0.authorDetails?.username ?? "",
                                 avatar: $0.authorDetails?.avatarPath ?? "",
                                 content: $0.content ?? "",
                                 rating: $0.authorDetails?.rating ?? 0)
                }
                
                let limit = 4
                var reviews: [ReviewEntity] = []
                if entities.count > 4 {
                    let difference = entities.count - limit
                    for i in 0..<(entities.count - difference) {
                        reviews.append(entities[i])
                    }
                }else {
                    reviews = entities
                }
                
                completion(.success(reviews))
            }
        }
    }
    
    func getTrailer(parameter: [String : Any], completion: @escaping (Result<[TrailerEntity], DataError>) -> Void) {
        
        datasource.fetchTrailer(param: parameter) { (result) in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(models):
                let entities = models.map {
                    TrailerEntity(id: $0.id ?? "",
                                  name: $0.name ?? "",
                                  key: $0.key ?? "",
                                  site: $0.site ?? "")
                }
                completion(.success(entities))
            }
        }
        
    }
}
