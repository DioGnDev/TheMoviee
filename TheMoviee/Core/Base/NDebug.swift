//
//  NDebug.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation

enum DebugType{
    case enabled
    case disabled
}

class NDebug {
    
    static var debug: DebugType = .disabled
    
    static func makeActive(should debug: DebugType){
        self.debug = debug
    }
}

func debug(with key: String, message value: Any) {
    
    switch NDebug.debug {
    case .enabled:
        print("😎 \(key): \(value)")
    case .disabled:
        break
    }
    
}
