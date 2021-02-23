//
//  BaseUsecase.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation

protocol BaseUsecase {
    associatedtype T
    associatedtype P
    associatedtype E: Error
    
    func execute(param: P,
                 completion: @escaping(Result<T, E>) -> Void)
}

extension BaseUsecase{
    func execute(param: P,
                 completion: @escaping(Result<T, E>) -> Void) {}
}
