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

public enum HomePageScene {
    case homePage
}

extension HomePageScene: SceneType {
    public func viewController() -> UIViewController {
        switch self {
        case .homePage:
            guard let homePage = HomePageViewController.instantiateFromAppStoryboard(appStoryboard: .custom(name: HomePageViewController.viewName, bundle: ConfigBundle.homePage)) else { return UIViewController() }
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
