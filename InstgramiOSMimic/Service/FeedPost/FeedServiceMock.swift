//
//  FeedServiceMock.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 13/09/2021.
//

import Foundation
class FeedServiceMock: FeedPostNetworkServiceProtocol {
    private let feedData = Data( """
{
   "posts":[
      {
         "imageURL":"https://redstapler.co/wp-content/uploads/2019/05/3d-photo-from-image-800x500.jpg",
         "liked":false
      },
      {
         "imageURL":"https://i.stack.imgur.com/GsDIl.jpg",
         "liked":true
      },
      {
         "imageURL":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU3HFVnkYFJ_OIogo__Qv58bmhwRqZJcQhOA&usqp=CAU",
         "liked":false
      },
      {
         "imageURL":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFFgU860_J_2RNo-4FUfUSwYIBzEtwUNhJ-w&usqp=CAU",
         "liked":true
      }
   ]
}
""".utf8)
    
    func getFeeds(completion: @escaping (Result<[FeedPost]?, NetworkError>) -> Void) {
        guard let posts = try? JSONDecoder().decode(Feed.self, from: feedData) else {
            completion(.failure(.noData))
            return
        }
        completion(.success(posts.posts))
    }
    
    
}
