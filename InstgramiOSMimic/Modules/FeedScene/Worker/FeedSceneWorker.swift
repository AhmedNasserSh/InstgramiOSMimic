//
//  FeedSceneWorker.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
class FeedSceneWorker: FeedSceneWorkerProtocol {
    private let cacheService: FeedPostCacheServiceProtocol 
    private let networkService: FeedPostNetworkServiceProtocol

    init(cachedService: FeedPostCacheServiceProtocol,
         networkService: FeedPostNetworkServiceProtocol){
        self.networkService  = networkService
        self.cacheService = cachedService
    }
    
    func getFeedPosts(type: DataSourceType, completion: @escaping (Result<[FeedPost]?, NetworkError>) -> Void) {
        switch type {
        case .cache:
            getCachedData(completion: completion)
        case .network:
            getNetworkData(completion: completion)
        }
    }

    private func getCachedData(completion: @escaping (Result<[FeedPost]?, NetworkError>) -> Void) {
        guard let cachedPosts = cacheService.fetch() else {
            completion(.failure(.noData))
            return
        }
        completion(.success(cachedPosts))
    }
    
    private func getNetworkData(completion: @escaping (Result<[FeedPost]?, NetworkError>) -> Void) {
        networkService.getFeeds(completion: completion)
    }
    
}
