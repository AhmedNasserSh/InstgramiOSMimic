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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intiUI()
    }
    
    func intiUI() {
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
    }

}
extension FeedSceneViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)
        return cell
    }
}

extension FeedSceneViewController: FeedSceneViewProtocol {

    func setFeed(posts: [FeedPost]) {
        
    }
    
    func setError(error: NetworkError) {
        
    }
}
