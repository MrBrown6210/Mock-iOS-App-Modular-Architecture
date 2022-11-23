//
//  Theme.swift
//  Core
//
//  Created by Ratchata Nuanchan on 24/11/2565 BE.
//

import Foundation
import UIKit

public class Theme {
    //Easy to change default app fonts family
    public static let fontsFamily = UIFont.Family.dbHeavent
    public static let color = KFColor()
}

public class KFColor {
    // Component
    public let primary: UIColor         = UIColor(hex: "#F37024")
    public let border: UIColor          = UIColor(hex: "#D8D8D8")
    public let bivider: UIColor         = UIColor(hex: "#F0F0F0")
    public let background: UIColor      = UIColor(hex: "#F9F9F9")
    public let white: UIColor           = UIColor(hex: "#FFFFFF")
    public let fieldGrey: UIColor       = UIColor(hex: "#FAFAFA")
    public let buttonDisable: UIColor   = UIColor(hex: "#D8D8D8")
    public let error: UIColor           = UIColor(hex: "#F2303C")
    public let placeholder: UIColor     = UIColor(hex: "#C9C9C9")
    public let lightGrey: UIColor       = UIColor(hex: "#E7E7E7")
    public let orange: UIColor          = UIColor(hex: "#FFF7F2")
    public let orangePrimary: UIColor   = UIColor(hex: "#F26922")
    public let greyScale: UIColor       = UIColor(hex: "#FEFEFE")
    public let shadow: UIColor          = UIColor(hex: "#BABABA")

    // Text
    public let textPrimary: UIColor     = UIColor(hex: "#39312C")
    public let textSecondary: UIColor   = UIColor(hex: "#A8A8A8")
    public let textProgress: UIColor    = UIColor(hex: "#F37021")
    public let textTabbar: UIColor      = UIColor(hex: "#ABABAB")
    public let textInput: UIColor       = UIColor(hex: "#4E4E4E")
    
    public let buttonMajor: UIColor     = UIColor(hex: "#F37024")
    public let buttonMinor: UIColor     = UIColor(hex: "#FFFFFF")
    
    public let gradian: [UIColor]      =  [UIColor(hex: "FFE4D4"), UIColor(hex: "FFFDFC")]
    
    public let gradianGreen: [UIColor]      =  [UIColor(hex: "DBFFF4"), UIColor(hex: "A2F4DB")]
    public let gradianBlue: [UIColor]      =  [UIColor(hex: "DCF4FF"), UIColor(hex: "BED0FC")]
    public let gradianOrange: [UIColor]      =  [UIColor(hex: "FFE4D4"), UIColor(hex: "FFDBC6")]
    public let gradianOrange2: [UIColor]      =  [UIColor(hex: "F26922"), UIColor(hex: "FBB040")]

    // Background
    public let errorBackground: UIColor   = UIColor(hex: "#FFF0F1")
}
