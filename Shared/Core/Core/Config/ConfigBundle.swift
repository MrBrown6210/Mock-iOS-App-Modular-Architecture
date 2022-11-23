//
//  ConfigBundle.swift
//  Core
//
//  Created by Ratchata Nuanchan on 23/11/2565 BE.
//

import Foundation

public struct ConfigBundle {
    public static var main: Bundle          = .main
    public static var core: Bundle          = Bundle(identifier: "com.ratchata.Core") ?? .main
    public static var homePage: Bundle          = Bundle(identifier: "com.ratchata.HomePage") ?? .main
    public static var delivery: Bundle          = Bundle(identifier: "com.ratchata.Delivery") ?? .main
}
