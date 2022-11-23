//
//  UIVIew+Extension.swift
//  Core
//
//  Created by Ratchata Nuanchan on 24/11/2565 BE.
//

import Foundation
import UIKit

extension UIView {
    public func setBorder(width: CGFloat = 4.0, color: UIColor = .white) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
