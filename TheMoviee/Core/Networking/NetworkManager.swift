//
//  NetworkManager.swift
//  Osvas-iOS
//
//  Created by Ilham Hadi Prabawa on 5/6/20.
//  Copyright © 2020 Osvas. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class NetworkManager {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private static var instance: NetworkManager?
    
    class var shared: NetworkManager {
        guard let instance = self.instance else {
            let instance = NetworkManager()
            self.instance = instance
            return instance
        }
        
        return instance
    }
    
    class func destroy() {
        self.instance = nil
    }

}
