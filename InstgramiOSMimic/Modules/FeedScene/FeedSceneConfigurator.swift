//
//  FeedSceneConfigurator.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
import UIKit

enum FeedSceneConfigurator {
    static func configure() -> UINavigationController {
        
        let viewController = FeedSceneViewController()
        let presenter = FeedScenePresenter(view: viewController)
        let worker = FeedSceneWorker()
        let interactor = FeedSceneInteractor(worker: worker, presenter: presenter)
        
        viewController.interactor = interactor
        
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}

