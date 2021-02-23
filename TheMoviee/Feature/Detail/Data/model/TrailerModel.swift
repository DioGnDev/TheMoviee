//
//  TrailerModel.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/24/21.
//

import Foundation

// MARK: - TrailerResponse
struct TrailerResponse: Codable {
    let id: Int?
    let results: [TrailerModel]?
}

// MARK: - Result
struct TrailerModel: Codable {
    let id, iso639_1, iso3166_1, key: String?
    let name, site: String?
    let size: Int?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case id
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case key, name, site, size, type
    }
}
