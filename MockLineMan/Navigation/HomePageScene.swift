//
//  HomePageScene.swift
//  MockLineMan
//
//  Created by Ratchata Nuanchan on 23/11/2565 BE.
//

import Foundation
import Core
import UIKit
import HomePage
import Delivery

public enum HomePageScene {
    case homePage
}

extension HomePageScene: SceneType {
    public func viewController() -> UIViewController {
        switch self {
        case .homePage:
            guard let homePage = HomePageViewController.instantiateFromAppStoryboard(appStoryboard: .custom(name: HomePageViewController.viewName, bundle: ConfigBundle.homePage)) else { return UIViewController() }
            homePage.config(opener: opener())
            return homePage
        }
    }
    
    public var storyboard: UIStoryboard {
        switch self {
        case .homePage:
            return UIStoryboard(name: HomePageViewController.viewName, bundle: ConfigBundle.homePage)
        }
    }
    
    public var identifier: String {
        switch self {
        case .homePage:
            return HomePageViewController.identifier
        }
    }
        
}

extension HomePageScene {
    func opener() -> (HomePageOpenerHandler) {
        return { opener in
            switch opener {
            case .deliveryHome:
                let scene: SceneType = DeliveryScene.deliveryHome
                let transition: SceneTransitionType = .modal(scene: scene, animated: true, presentationStyle: .fullScreen)
                let coordinator: SceneCoordinator = SceneCoordinator()
                coordinator.transition(type: transition)
            case .taxiHome:
                let scene: SceneType = TaxiScene.taxiHome
                let transition: SceneTransitionType = .modal(scene: scene, animated: true, presentationStyle: .fullScreen)
                let coordinator: SceneCoordinator = SceneCoordinator()
                coordinator.transition(type: transition)
            }
        }
    }
}
