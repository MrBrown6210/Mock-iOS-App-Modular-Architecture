//
//  UIWindow+Extension.swift
//  Core
//
//  Created by Ratchata Nuanchan on 23/11/2565 BE.
//

import Foundation
import UIKit

extension UIWindow {
    public func topMostViewController() -> UIViewController? {
        guard let rootViewController = self.rootViewController else {
            return nil
        }
        
        var topController = rootViewController
        
        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }
        
        return topController
    }
}

extension UIApplication {
    public class func getTopView() -> UIViewController? {
        let window = UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }
        return window?.topMostViewController()
    }
    
    public class func getWindow() -> UIWindow? {
        let window = UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }
        return window
    }
}

