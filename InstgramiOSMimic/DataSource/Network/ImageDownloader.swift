//
//  ImageDownloader.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
import UIKit
struct ImageDownloader {
    private var request: Request<UIImage>
    private lazy var downloadClient = NetworkClient()
    
    init(url: URL) {
        self.request = Request(url: url, parse: { data in
            return UIImage(data: data)
        })
    }
    
    mutating func download(completion: @escaping (Result<UIImage,NetworkError>) -> Void)  {
        downloadClient.load(request: request,completion: completion)
    }
}
