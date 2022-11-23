//
//  UIButton+Extension.swift
//  Core
//
//  Created by Ratchata Nuanchan on 24/11/2565 BE.
//

import Foundation
import UIKit

public enum ButtonStyleType {
    case primary
    case secondary
    case acceptanceDisable
    case text
}
extension UIButton {
    public func setStyle(style: ButtonStyleType = .primary, radius: CGFloat = 8.0) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.borderColor = Theme.color.primary.cgColor
        
        switch style {
        case .primary:
            self.backgroundColor = Theme.color.buttonMajor
            self.setTitleColor(UIColor.white, for: .normal)
            self.tintColor = UIColor.white
        case .secondary:
            self.backgroundColor = Theme.color.buttonMinor
            self.setTitleColor(Theme.color.buttonMajor, for: .normal)
            self.layer.borderWidth = 1
            self.tintColor = Theme.color.primary
        case .acceptanceDisable:
            self.backgroundColor = Theme.color.bivider
            self.setTitleColor(Theme.color.textSecondary, for: .normal)
            self.tintColor = Theme.color.textSecondary
            self.setBorder(width: 1, color: Theme.color.lightGrey)
        case .text:
            self.backgroundColor = .white
            self.setTitleColor(Theme.color.buttonMajor, for: .normal)
            self.setTitleColor(Theme.color.buttonMajor, for: .selected)
            self.setTitleColor(Theme.color.buttonMajor, for: .highlighted)
            self.tintColor = Theme.color.primary
            self.layer.borderWidth = 0
        }
        self.titleLabel?.font =  UIFont.buttonTitle
        DispatchQueue.main.async {
            self.titleLabel?.font =  UIFont.buttonTitle
            self.setNeedsDisplay()
        }
    }
}
