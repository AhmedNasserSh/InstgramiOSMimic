//
//  FeedSceneProtocols.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
import UIKit
protocol FeedSceneViewProtocol{
    var interactor: FeedSceneInteractorProtocol? { get }
    var router: FeedSceneRouterProtocol? { get }
    
    func setFeed(posts: [PostTableViewCellModel])
    func updateFeed(at index: Int, image: UIImage?)
    func setError(error: NetworkError)
}

protocol FeedSceneInteractorProtocol{
    var worker: FeedSceneWorkerProtocol? { get }
    var presenter: FeedScenePresenterProtocol? { get }
    
    func getFeedPosts()
    func cancelDownload(index: Int)
}

protocol FeedScenePresenterProtocol{
    var view: FeedSceneViewProtocol? { get }
    
    func PresentFeed(posts: [FeedPost]?)
    func presentError(error: NetworkError)
    func cancelDownload(index: Int)
}

protocol FeedSceneRouterProtocol{
    
}

protocol FeedSceneWorkerProtocol{
    func getFeedPosts(type: DataSourceType, completion: @escaping (Result<[FeedPost]?,NetworkError>) -> Void)
}
