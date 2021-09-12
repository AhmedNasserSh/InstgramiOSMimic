//
//  FeedSceneInteractor.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
class FeedSceneInteractor: FeedSceneInteractorProtocol {
    var worker: FeedSceneWorkerProtocol?
    var presenter: FeedScenePresenterProtocol?
    
    init(worker: FeedSceneWorkerProtocol, presenter: FeedScenePresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
    
}
extension FeedSceneInteractor {
    func getFeedPosts() {
        worker?.getFeedPosts(type: .network, completion: { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let feedPosts):
                self.presenter?.PresentFeed(posts: feedPosts)
            case .failure(let error):
                self.presenter?.presentError(error: error)
            }
        })
    }
    
    func cancelDownload(index: Int) {
        presenter?.cancelDownload(index: index)
    }
    
}
