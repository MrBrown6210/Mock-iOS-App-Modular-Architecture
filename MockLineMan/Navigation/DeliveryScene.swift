//
//  DeliveryScene.swift
//  MockLineMan
//
//  Created by Ratchata Nuanchan on 24/11/2565 BE.
//

import Foundation
import UIKit
import Core
import Delivery

public enum DeliveryScene {
    case deliveryHome
}

extension DeliveryScene: SceneType {
    public func viewController() -> UIViewController {
        switch self {
        case .deliveryHome:
            guard let homePage = DeliveryHomeViewController.instantiateFromAppStoryboard(appStoryboard: .custom(name: DeliveryHomeViewController.viewName, bundle: ConfigBundle.delivery)) else { return UIViewController() }
            return homePage
        }
    }
    
    public var storyboard: UIStoryboard {
        switch self {
        case .deliveryHome:
            return UIStoryboard(name: DeliveryHomeViewController.viewName, bundle: ConfigBundle.delivery)
        }
    }
    
    public var identifier: String {
        switch self {
        case .deliveryHome:
            return DeliveryHomeViewController.identifier
        }
    }
    
    
}
