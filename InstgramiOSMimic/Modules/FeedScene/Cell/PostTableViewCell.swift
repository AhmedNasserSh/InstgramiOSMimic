//
//  PostTableViewCell.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    static let identifier = "PostTableViewCell"
    
    func configure(model: PostTableViewCellModel) {
        self.likeButton.setImage(model.likeButtonImage, for: .normal)
        self.postImageView.image = model.posImage

    }
    
    @IBAction func didTabLike(_ sender: Any) {
    }
    
    @IBAction func didTabShare(_ sender: Any) {
    }
}
