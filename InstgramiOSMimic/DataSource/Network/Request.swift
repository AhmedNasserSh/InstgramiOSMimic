//
//  Request.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
struct Request<Output> {
    let url: URL
    let parse: (Data) -> Output?
}
