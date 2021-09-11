//
//  FeedScenePresenter.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
struct FeedScenePresenter: FeedScenePresenterProtocol {
    var view: FeedSceneViewProtocol?
    
    func presnentFeed(posts: [FeedPost]?) {
        guard let posts = posts else {return}
        self.view?.setFeed(posts: posts)
    }
    
    func presnentError(error: NetworkError) {
        self.view?.setError(error: error)
    }
    
    
}
