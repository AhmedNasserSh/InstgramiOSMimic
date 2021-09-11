//
//  Storage.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
protocol Storage {
    associatedtype ModelType
    
    func save(input: ModelType)
    func fetch() -> [ModelType]?
}
