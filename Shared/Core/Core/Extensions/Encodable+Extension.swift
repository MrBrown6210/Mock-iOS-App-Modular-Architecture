//
//  Encodable+Extension.swift
//  Core
//
//  Created by Ratchata Nuanchan on 25/11/2565 BE.
//

import Foundation

extension Encodable {
    public func tryToJSON() throws -> [String: Any] {
        let encoded = try JSONEncoder().encode(self)
        let json = try JSONSerialization.jsonObject(with: encoded) as? [String: Any]
        return json ?? [:]
    }
    
    public func toJSON() -> [String: Any] {
        do {
            let encoded = try JSONEncoder().encode(self)
            let json = try JSONSerialization.jsonObject(with: encoded) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
    
    public func toString() throws -> String {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(self)
        return String(data: jsonData, encoding: .utf8) ?? "fail to convert"
    }
    
    public func encode() -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(self)
            let jsonDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
            return jsonDict
        }catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

extension Decoder {
    public subscript(_ key: String) -> (Decoder, String) {
        return (self, key)
    }
}
