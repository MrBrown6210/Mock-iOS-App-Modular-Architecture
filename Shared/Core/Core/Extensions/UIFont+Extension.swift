//
//  UIFont+Extension.swift
//  Core
//
//  Created by Ratchata Nuanchan on 24/11/2565 BE.
//

import Foundation
import UIKit

// MARK: Manipulate Fonts
public extension UIFont {
    enum Family: String, CaseIterable {
        case system    = "System"
        case dbHeavent = "DBHeavent"
    }
    
    enum CustomWeight: String {
        case light      = "Light"
        case regular    = "Regular"
        case medium     = "Medium"
        case bold       = "Bold"
        
        func systemWeight() -> UIFont.Weight {
            switch self {
            case .light:
                return UIFont.Weight.light
            case .regular:
                return UIFont.Weight.regular
            case .medium:
                return UIFont.Weight.medium
            case .bold:
                return UIFont.Weight.bold
            }
        }
        
        func customWeight() -> SupportedFont {
            switch self {
            case .light:
                return SupportedFont.dbHeaventLight
            case .regular:
                return SupportedFont.dbHeaventRegular
            case .medium:
                return SupportedFont.dbHeaventMedium
            case .bold:
                return SupportedFont.dbHeaventBold
            }
        }
    }
    
    //MARK: - Make custom font bundle register to framework
    static func loadFontWith(name: String) {
        let frameworkBundle = ConfigBundle.core
        let pathForResourceString = frameworkBundle.path(forResource: name, ofType: "ttf")
        let fontData = NSData(contentsOfFile: pathForResourceString!)
        let dataProvider = CGDataProvider(data: fontData!)
        let fontRef = CGFont(dataProvider!)
        var errorRef: Unmanaged<CFError>? = nil
        
        if (CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) == false) {
            debugPrint("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }
      
    static let loadMyFonts: () = {
        loadFontWith(name: SupportedFont.dbHeaventMedium.fontName)
        loadFontWith(name: SupportedFont.dbHeaventLight.fontName)
        loadFontWith(name: SupportedFont.dbHeaventRegular.fontName)
        loadFontWith(name: SupportedFont.dbHeaventBold.fontName)
        loadFontWith(name: SupportedFont.dbHeaventThin.fontName)
    }()
}

public enum SupportedFont: String {
    // DBHeavent
    case dbHeaventMedium        = "DBHeavent-Me"
    case dbHeaventLight         = "DBHeaventt-Light"
    case dbHeaventRegular       = "DBHeavent"
    case dbHeaventBold          = "DBHeavent-Bold"
    case dbHeaventThin          = "DBHeavent-Thin"
    
    public func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
    
    var fontName: String {
        return self.rawValue
    }
    
    // MARK: - Important Font name in system not related with file of fonts
    // Developer have to print with this method and recheck with system name.
    public static func getAllFonts() {
        for family: String in UIFont.familyNames {
            debugPrint("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family) {
                debugPrint("== \(names)")
            }
        }
    }
}
