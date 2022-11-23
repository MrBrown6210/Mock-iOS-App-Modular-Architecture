//
//  UIViewController+Extension.swift
//  Core
//
//  Created by Ratchata Nuanchan on 23/11/2565 BE.
//

import Foundation
import UIKit

public extension UIViewController {
    class func topViewController() -> UIViewController? {
        let window = UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }
        
        return self.topViewControllerWithRootViewController(rootViewController: window?.topMostViewController())
    }
    
    class func topViewControllerWithRootViewController(rootViewController: UIViewController?) -> UIViewController? {
        
        if rootViewController is UITabBarController {
            let control = rootViewController as! UITabBarController
            return self.topViewControllerWithRootViewController(rootViewController: control.selectedViewController)
        } else if rootViewController is UINavigationController {
            let control = rootViewController as! UINavigationController
            return self.topViewControllerWithRootViewController(rootViewController: control.visibleViewController)
        } else if let control = rootViewController?.presentedViewController {
            return self.topViewControllerWithRootViewController(rootViewController: control)
        } else if let control = rootViewController?.children.first {
            return self.topViewControllerWithRootViewController(rootViewController: control)
        }
        return rootViewController
        
    }
}
