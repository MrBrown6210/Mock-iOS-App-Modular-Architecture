//
//  UILabel+Extension.swift
//  Core
//
//  Created by Ratchata Nuanchan on 24/11/2565 BE.
//

import Foundation
import UIKit

public enum labelStyle {
    // Bold.of(size: 24)
    case h1
    
    // Bold.of(size: 28)
    case h1Black
    
    // Bold.of(size: 20)
    case h2
    
    // Regular.of(size: 18)
    case h3
    
    // Regular.of(size: 20)
    case body
    
    // Regular.of(size: 20) Black
    case bodyBlack
    
    // Regular.of(size: 20) Primary
    case bodyPrimary
    
    // Regular.of(size: 24) Primary
    case h1Reg
    
    // Bold.of(size: 24) Primary Color
    case h1Primary
    
    //Bold.of(size: 20) Primary Color
    case h2Primary
    
    // Regular.of(size: 24) Brand Primary No BgColor
    case h1brandPrimary
    
    // Regular.of(size: 18) Brand Primary
    case brandPrimary
    
    // Regular.of(size: 18) Brand Primary No BgColor
    case brandPrimaryLess
    
    // Bold.of(size: 28) Brand Primary No BgColor
    case brandPrimaryLarge
    
    case error

    // Regular.of(size: 14)
    case tabbar

    // Regular.of(size: 14)
    case tabbarPrimary
}

extension UILabel {
    public func setStyle(_ style: labelStyle = .body) {
        switch style {
        case .h1:
            self.font = UIFont.h1
            self.textColor = Theme.color.textPrimary
        case .h1Black:
            self.font = UIFont.h1Bold
            self.textColor = Theme.color.textPrimary
        case .h2:
            self.font = UIFont.h2
            self.textColor = Theme.color.textPrimary
        case .h3:
            self.font = UIFont.h3
            self.textColor = Theme.color.textPrimary
        case .body:
            self.font = UIFont.body
            self.textColor = Theme.color.textSecondary
        case .bodyBlack:
            self.font = UIFont.body
            self.textColor = Theme.color.textPrimary
        case .bodyPrimary:
            self.font = UIFont.body
            self.textColor = Theme.color.primary
        case .h1Reg:
            self.font = UIFont.h1Reg
            self.textColor = Theme.color.textPrimary
        case .h1Primary:
            self.font = UIFont.h1
            self.textColor = Theme.color.primary
        case .h2Primary:
            self.font = UIFont.h2
            self.textColor = Theme.color.primary
        case .h1brandPrimary:
            self.font = UIFont.h1
            self.textColor = Theme.color.textProgress
        case .brandPrimary:
            self.font = UIFont.h3
            self.textColor = Theme.color.textProgress
            self.backgroundColor = Theme.color.orange
        case .brandPrimaryLess:
            self.font = UIFont.h3
            self.textColor = Theme.color.textProgress
        case .brandPrimaryLarge:
            self.font = UIFont.largePrice
            self.textColor = Theme.color.textProgress
        case .error:
            self.font = UIFont.body
            self.textColor = Theme.color.error
        case .tabbar:
            self.font = UIFont.subTitle
            self.textColor = Theme.color.textTabbar
        case .tabbarPrimary:
            self.font = UIFont.subTitle
            self.textColor = Theme.color.primary
        }
    }
}
