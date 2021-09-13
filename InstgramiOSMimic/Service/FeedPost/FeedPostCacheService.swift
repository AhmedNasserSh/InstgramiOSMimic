//
//  FeedPostCacheService.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
import CoreData
protocol FeedPostCacheServiceProtocol {
    func save(input: FeedPost)
    func fetch() -> [FeedPost]?
}

struct FeedPostCacheService: FeedPostCacheServiceProtocol{
    private let storage: CoreDataStore
    init(storage: CoreDataStore) {
        self.storage = storage
    }
    
    func save(input: FeedPost) {
        storage.save() { model in
            if let post = model as? Post {
                post.imageURL = input.imageURL
                post.liked = input.liked
                return post
            }
            return nil 
        }
    }
    
    func fetch() -> [FeedPost]? {
        storage.fetch(type: Entity.post.rawValue) { postEntities in
            guard let posts = postEntities as? [Post] else {return nil}
            return posts.compactMap{FeedPost(imageURL: $0.imageURL, liked: $0.liked)}
        }
    }
    
}
