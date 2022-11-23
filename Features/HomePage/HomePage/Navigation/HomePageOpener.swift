//
//  HomePageOpener.swift
//  HomePage
//
//  Created by Ratchata Nuanchan on 24/11/2565 BE.
//

import Foundation

public typealias HomePageOpenerHandler = ((HomePageOpener) -> Void)?

public enum HomePageOpener {
    case deliveryHome
    case taxiHome
}
