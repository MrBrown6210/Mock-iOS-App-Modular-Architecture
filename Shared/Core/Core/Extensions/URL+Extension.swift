//
//  URL+Extension.swift
//  Core
//
//  Created by Ratchata Nuanchan on 25/11/2565 BE.
//

import Foundation

extension URL {
    public func convertToData() -> Data? {
        let data = try? Data.init(contentsOf: self)
        return data
    }
}
