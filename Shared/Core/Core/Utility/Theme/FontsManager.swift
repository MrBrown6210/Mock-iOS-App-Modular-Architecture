//
//  FontsManager.swift
//  Core
//
//  Created by Ratchata Nuanchan on 24/11/2565 BE.
//

import Foundation
import UIKit

//MARK: - Initializers UIFont UIKit
extension UIFont {
    // How to use: UIFont.setCustom(size: 18, weight: .bold)
    static public func setCustom(size: CGFloat, weight: CustomWeight, family: UIFont.Family = Theme.fontsFamily) -> UIFont {
        switch family {
        case .system:
            return UIFont.systemFont(ofSize: size, weight: weight.systemWeight())
        case .dbHeavent:
            return weight.customWeight().of(size: size)
        }
    }
    
    // How to use: UIFont.headline
    static public var headline: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 18, weight: .medium)
        case .dbHeavent:
            return SupportedFont.dbHeaventBold.of(size: 32)
        }
    }
    
    static public var buttonTitle: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 18, weight: .bold)
        case .dbHeavent:
            return SupportedFont.dbHeaventBold.of(size: 20)
        }
    }
    
    static public var h1: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 24, weight: .bold)
        case .dbHeavent:
            return SupportedFont.dbHeaventBold.of(size: 24)
        }
    }
    
    static public var h2: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 20, weight: .bold)
        case .dbHeavent:
            return SupportedFont.dbHeaventBold.of(size: 20)
        }
    }
    
    static public var h3: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 18, weight: .bold)
        case .dbHeavent:
            return SupportedFont.dbHeaventRegular.of(size: 18)
        }
    }
    
    static public var body: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 20, weight: .regular)
        case .dbHeavent:
            return SupportedFont.dbHeaventRegular.of(size: 20)
        }
    }
    
    static public var subTitle: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 14, weight: .medium)
        case .dbHeavent:
            return SupportedFont.dbHeaventRegular.of(size: 14)
        }
    }
    
    static public var text: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 12, weight: .regular)
        case .dbHeavent:
            return SupportedFont.dbHeaventRegular.of(size: 12)
        }
    }
    
    static public var caption: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 10, weight: .regular)
        case .dbHeavent:
            return SupportedFont.dbHeaventRegular.of(size: 10)
        }
    }
    
    static public var pinNumber: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 28, weight: .regular)
        case .dbHeavent:
            return SupportedFont.dbHeaventRegular.of(size: 28)
        }
    }
    
    static public var largePrice: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 28, weight: .bold)
        case .dbHeavent:
            return SupportedFont.dbHeaventBold.of(size: 28)
        }
    }
    
    static public var h1Reg: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 24, weight: .regular)
        case .dbHeavent:
            return SupportedFont.dbHeaventRegular.of(size: 24)
        }
    }
    
    static public var h1Bold: UIFont {
        switch Theme.fontsFamily {
        case .system:
            return UIFont.systemFont(ofSize: 28, weight: .regular)
        case .dbHeavent:
            return SupportedFont.dbHeaventBold.of(size: 28)
        }
    }
}
