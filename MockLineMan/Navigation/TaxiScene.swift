//
//  TaxiScene.swift
//  MockLineMan
//
//  Created by Ratchata Nuanchan on 24/11/2565 BE.
//

import Foundation
import UIKit
import Core
import Taxi

public enum TaxiScene {
    case taxiHome
}

extension TaxiScene: SceneType {
    public func viewController() -> UIViewController {
        switch self {
        case .taxiHome:
            guard let homePage = TaxiHomeViewController.instantiateFromAppStoryboard(appStoryboard: .custom(name: TaxiHomeViewController.viewName, bundle: ConfigBundle.taxi)) else { return UIViewController() }
            return homePage
        }
    }
    
    public var storyboard: UIStoryboard {
        switch self {
        case .taxiHome:
            return UIStoryboard(name: TaxiHomeViewController.viewName, bundle: ConfigBundle.taxi)
        }
    }
    
    public var identifier: String {
        switch self {
        case .taxiHome:
            return TaxiHomeViewController.identifier
        }
    }
    
    
}
