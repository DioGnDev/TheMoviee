//
//  DetailMovieRepositoryLogic.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//

import Foundation

protocol DetailMovieRepositoryLogic {
    func getDetailMovie(parameter: [String: Any],
                             completion: @escaping(Result<DetailMovieEntity, DataError>) -> Void)
    
    func getReview(parameter: [String: Any],
                   completion: @escaping(Result<[ReviewEntity], DataError>) -> Void)
    
    func getTrailer(parameter: [String: Any],
                    completion: @escaping(Result<[TrailerEntity], DataError>) -> Void)
}

