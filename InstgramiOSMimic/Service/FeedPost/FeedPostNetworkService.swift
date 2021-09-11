//
//  FeedPostNetworkService.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
class FeedPostNetworkService {
    private let client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
    }
    
    func getFeeds(completion: @escaping (Result<[FeedPost]?,NetworkError>) -> Void)  {
        guard let url = URL(string: "") else {
            completion(.failure(.parse))
            return
        }
        
        let request = Request(url: url) { data in
            return try? JSONDecoder().decode(Feed.self, from: data)
        }
        client.load(request: request) { result in
            switch result  {
            case .success(let feed):
                completion(.success(feed.posts))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
