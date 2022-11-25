//
//  String+Extension.swift
//  Core
//
//  Created by Ratchata Nuanchan on 25/11/2565 BE.
//

import Foundation

extension String {
    public func convertToURL() -> URL? {
        return URL.init(string: self)
    }
    
    public func toDate(format: String? = nil) -> Date? {
        let dateFormatter = DateFormatter()
        if let format = format {
            dateFormatter.dateFormat = format
        }
        return dateFormatter.date(from: self)
    }
}
