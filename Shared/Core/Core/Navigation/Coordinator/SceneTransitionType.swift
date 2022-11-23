//
//  SceneTransitionType.swift
//  Core
//
//  Created by Ratchata Nuanchan on 23/11/2565 BE.
//

import Foundation
import UIKit

public enum SceneTransitionType {
    case root(scene: SceneType)
    case push(scene: SceneType, animated: Bool)
    case backToRootAndPush(scene: SceneType, animated: Bool)
    case modal(scene: SceneType, animated: Bool, presentationStyle: UIModalPresentationStyle = .automatic)
    case pop(animated: Bool)
    case dismiss(animated: Bool, completion: (() -> Void)? = nil)
}
