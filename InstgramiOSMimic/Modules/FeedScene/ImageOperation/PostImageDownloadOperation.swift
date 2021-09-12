//
//  PostImageDownloadOperation.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 12/09/2021.
//

import Foundation
import UIKit

class PostImageDownloadOperation: Operation {
    private let completion: (UIImage?) -> Void
    private var imageDownloader: ImageDownloader
    
    init(url:URL, completion: @escaping (UIImage?) -> Void) {
        self.completion = completion
        self.imageDownloader = ImageDownloader(url: url)
    }
    
    override func main() {
        if isCancelled {
            completion(nil)
            return
        }
        imageDownloader.download { [weak self] result in
            guard let self = self ,
                  !self.isCancelled else {
                self?.completion(nil)
                return
            }
            switch result {
            case .success(let image):
                self.completion(image)
            case .failure:
                self.completion(nil)
            }
        }
    }
    
    
}
