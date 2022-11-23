//
//  SceneType.swift
//  Core
//
//  Created by Ratchata Nuanchan on 23/11/2565 BE.
//

import Foundation
import UIKit

public protocol SceneType {
    func viewController() -> UIViewController
    var storyboard: UIStoryboard { get }
    var identifier: String { get }
}

