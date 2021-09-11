//
//  FeedPostStore.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
import CoreData

struct FeedPostStore: Storage {
    typealias ModelType = FeedPost
        
    func save(input: ModelType) {
        let post = Post(context: CoreDataManager.shared.privateContext)
        post.imageURL = input.imageURL
        post.liked = input.liked
        CoreDataManager.shared.saveContext()
    }
    
    func fetch() -> [ModelType]? {
        CoreDataManager.shared.fetchEntity(entity: .post, predicate: nil) { postEntities -> [ModelType]? in
            guard let posts = postEntities as? [Post] else {return nil}
            return posts.compactMap{FeedPost(imageURL: $0.imageURL, liked: $0.liked)}
        }
    }
    
}
