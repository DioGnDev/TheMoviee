//
//  BaseRequest.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation

class BaseRequest{
    var apiKey: String = Environment.apiKey
    var language: String = "en-US"
    
    func toParam() -> [String: Any]{
        return [:]
    }
}
