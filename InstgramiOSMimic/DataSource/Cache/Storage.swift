//
//  Storage.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
protocol Storage: AnyObject {
    associatedtype Input
    func save<Model>(mapper: (Model) -> Model?) where Model == Input
    func fetch<Output>(type: String, mapper: ([Input]) -> [Output]?) -> [Output]?
}
