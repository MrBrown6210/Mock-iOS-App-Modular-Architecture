//
//  AppStoryboard.swift
//  Core
//
//  Created by Ratchata Nuanchan on 23/11/2565 BE.
//

import Foundation
import UIKit

public enum AppStoryboard {
    case custom(name: String, bundle: Bundle)
    
    public var bundleId: Bundle {
        switch self {
        case .custom(_, let bundle):
            return bundle
        }
    }
  
    public var instance: UIStoryboard {
        switch self {
        case .custom(let name, let bundle):
            return UIStoryboard(name: name, bundle: bundle)
        }
        
    }
    
    public func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T? {
        let storyboardId = (viewControllerClass as UIViewController.Type).storyboardId
        guard let vc = instance.instantiateViewController(withIdentifier: storyboardId) as? T else { return nil }
        return vc
    }
    
    public func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

public extension UIViewController {
    class var storyboardId: String {
        return "\(self)"
    }
    
    static func instantiateFromAppStoryboard(appStoryboard: AppStoryboard) -> Self? {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
