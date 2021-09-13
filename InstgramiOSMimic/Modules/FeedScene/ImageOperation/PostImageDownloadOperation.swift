//
//  PostImageDownloadOperation.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 12/09/2021.
//

import Foundation
import UIKit

class PostImageDownloadOperation: Operation {
    var completion: (UIImage?) -> Void = {_ in}
    private var url: URL

    init(url:URL) {
        self.url = url
    }
    
    override func main() {
        if isCancelled {
            completion(nil)
            return
        }
        
        guard let imageData = try? Data(contentsOf: url) else { return }
        
        if isCancelled {
          return
        }
        
        if !imageData.isEmpty {
            completion(UIImage(data: imageData))
        }else {
            completion(nil)
        }
        
      
    }
    
    
}
