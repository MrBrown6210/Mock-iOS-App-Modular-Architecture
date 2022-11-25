//
//  Advertise.swift
//  HomePage
//
//  Created by Ratchata Nuanchan on 25/11/2565 BE.
//

import Foundation

public struct AdvertiseModel: Decodable, IAdvertise {
    public var createdAt: String?
    public var name: String?
    public var image: String?
    public var recommended_rate: Int?
    public var id: String?
}
