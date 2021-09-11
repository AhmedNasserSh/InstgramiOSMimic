//
//  FeedSceneProtocols.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
protocol FeedSceneViewProtocol{
    var interactor: FeedSceneInteractorProtocol? { get }
    var router: FeedSceneRouterProtocol? { get }
    
    func setFeed(posts: [FeedPost])
    func setError(error: NetworkError)
}

protocol FeedSceneInteractorProtocol{
    var worker: FeedSceneWorkerProtocol? { get }
    var presenter: FeedScenePresenterProtocol? { get }
    
    func getFeedPosts()

}

protocol FeedScenePresenterProtocol{
    var view: FeedSceneViewProtocol? { get }
    
    func presnentFeed(posts: [FeedPost]?)
    func presnentError(error: NetworkError)
}

protocol FeedSceneRouterProtocol{
    
}

protocol FeedSceneWorkerProtocol{
    func getFeedPosts(type: DataSourceType, completion: @escaping (Result<[FeedPost]?,NetworkError>) -> Void)
}
