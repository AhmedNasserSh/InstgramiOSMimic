//
//  PostTableViewCellModel.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 12/09/2021.
//

import Foundation
import UIKit
class PostTableViewCellModel {
    var likeButtonImage: UIImage?
    var posImage: UIImage?
    var completion: ((UIImage?) -> Void)?


    enum LikeImage: String {
        case unSelected = "heart"
        case selected = "heart-selected"
    }
}
