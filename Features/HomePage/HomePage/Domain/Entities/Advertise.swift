//
//  Advertise.swift
//  HomePage
//
//  Created by Ratchata Nuanchan on 25/11/2565 BE.
//

import Foundation

public protocol IAdvertise {
    var createdAt: String? { get }
    var name: String? { get }
    var image: String? { get }
    var recommended_rate: Int? { get }
    var id: String? { get }
}

public class Advertise {
    public var createdAt: Date?
    public var name: String?
    public var image: String?
    public var recommended_rate: Int
    public var id: String?
    
    init(model: IAdvertise) {
        self.createdAt = model.createdAt?.toDate()
        self.name = model.name
        self.image = model.image
        self.recommended_rate = model.recommended_rate ?? 0
        self.id = model.id
    }
}
