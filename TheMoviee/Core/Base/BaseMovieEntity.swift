//
//  BaseMovieEntity.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import Foundation

protocol BaseMovieEntity {
    var id: Int {get set}
    var title: String {get set}
    var description: String {get set}
    var poster: String {get set}
}
