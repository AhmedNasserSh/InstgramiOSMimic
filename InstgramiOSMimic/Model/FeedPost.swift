//
//  FeedPost.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
import UIKit

struct Feed: Codable {
    let posts: [FeedPost]
}

struct FeedPost: Codable {
    let imageURL: URL
    let liked: Bool
}

extension FeedPost {
    init?(imageURL: URL?,liked: Bool?)  {
        guard let imageURL = imageURL,
              let liked = liked else {return nil}
        
        self.imageURL = imageURL
        self.liked = liked
    }
}
