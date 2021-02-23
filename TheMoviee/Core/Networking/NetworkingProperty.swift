//
//  NetworkingProperty.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation
import UIKit
import Alamofire

struct Media {
    let key: String
    let filename: String
    let data: Data
    let mimeType: String
    
    init?(withImage image: UIImage, forKey key: String, fileName: String = "") {
        self.key = key
        self.mimeType = "image/jpeg"
        self.filename = fileName.isEmpty ? UUID().uuidString : fileName
        
        guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
        self.data = data
    }
}

public class BaseHeader{
    var contentType: String
    var accept: String
    var localization: String
    
    init() {
        self.contentType = "application/json"
        self.accept = "application/json"
        self.localization = "id"
    }
}

class Header: BaseHeader{
    
    var authorization: String
    
    init(authorization: String) {
        self.authorization = authorization
        super.init()
    }
    
    func toDictionary() -> [String: String] {
        return ["ContentType": self.contentType,
                "Accept": self.accept,
                "Authorization": self.authorization]
    }
}
