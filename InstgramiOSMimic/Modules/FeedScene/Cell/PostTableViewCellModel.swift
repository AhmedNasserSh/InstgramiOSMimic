//
//  PostTableViewCellModel.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 12/09/2021.
//

import Foundation
import UIKit
struct PostTableViewCellModel {
    var likeButtonImage: UIImage?
    var posImage: ((UIImage?) -> Void) = {_ in}
    
    enum LikeImage: String {
        case unSelected = "heart"
        case selected = "heart-selected"
    }
}
