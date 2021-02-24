//
//  Environment.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation

public enum Environment {
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static let baseURL: String = {
        return "https://api.themoviedb.org/3"
    }()
    
    static let apiKey: String = {
        return "4b92f9b248d265764f53e0b869bebe4d"
    }()
}
