//
//  FeedSceneViewController.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import UIKit

class FeedSceneViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var interactor: FeedSceneInteractorProtocol?
    var router: FeedSceneRouterProtocol?
    private var posts = [PostTableViewCellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intiUI()
    }
    
    func intiUI() {
        tableView.register(UINib(nibName: PostTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: PostTableViewCell.identifier) 
        interactor?.getFeedPosts()
    }

}
extension FeedSceneViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as? PostTableViewCell
        cell?.configure(model: posts[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      //  self.interactor?.cancelDownload(index: indexPath.row)
    }
}

extension FeedSceneViewController: FeedSceneViewProtocol {

    func setFeed(posts: [PostTableViewCellModel]) {
        self.posts = posts
        self.tableView.reloadData()
    }
    func updateFeed(at index: Int, image: UIImage?) {
        self.posts[index].posImage = image
        self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
    }
    
    func setError(error: NetworkError) {
        
    }
    
}
