//
//  FeedScenePresenter.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
import UIKit
struct FeedScenePresenter: FeedScenePresenterProtocol {
    
    var view: FeedSceneViewProtocol?
    let downloadQueue = ImageDownloadQueue()
    
    func PresentFeed(posts: [FeedPost]?) {
        guard let feedPosts = posts else {return}
        self.view?.setFeed(posts: mapPosts(posts: feedPosts))
    }
    
    
    private func mapPosts(posts: [FeedPost]) -> [PostTableViewCellModel] {
        return posts.map({ post in
            let cellModel = PostTableViewCellModel()
            let likeImage = post.liked ? PostTableViewCellModel.LikeImage.selected.rawValue : PostTableViewCellModel.LikeImage.unSelected.rawValue
            cellModel.likeButtonImage = UIImage(named: likeImage)
            let downloadOperation = PostImageDownloadOperation(url: post.imageURL)

            cellModel.completion = { image in
                guard let index = downloadQueue.getOperation(operation: downloadOperation) else{return}
                cellModel.posImage = image
                DispatchQueue.main.async {
                    view?.updateFeed(at: index, image: image)
                }
            }
            downloadOperation.completion = cellModel.completion!
            downloadQueue.addOperation(operation: downloadOperation)
            return cellModel
        })
    }
    
    func cancelDownload(index: Int) {
        downloadQueue.cancelOperation(index: index)
    }
    
    
    func presentError(error: NetworkError) {
        self.view?.setError(error: error)
    }
    
    
    
    
}
