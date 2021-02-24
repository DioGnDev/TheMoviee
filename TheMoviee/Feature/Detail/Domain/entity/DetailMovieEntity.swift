//
//  DetailMovieEntity.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//

import Foundation

struct DetailMovieEntity: BaseMovieEntity {
    
    var id: Int
    var title: String
    var description: String
    var poster: String
    var popularity: Double
    var status: String
    var releaseDate: String
}
