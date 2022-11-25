//
//  AdvertiseAPI.swift
//  HomePage
//
//  Created by Ratchata Nuanchan on 25/11/2565 BE.
//

import Foundation
import Moya
import Alamofire

public enum AdvertiseAPI {
    case getAdvertises(request: GetAdvertisesRequest)
}

extension AdvertiseAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://612136b1f5849d0017fb41c2.mockapi.io")!
    }
    
    public var path: String {
        return "advertises"
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var task: Task {
        switch self {
        case .getAdvertises(let request):
            return .requestParameters(parameters: request.toJSON(), encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String : String]? {
        return [:]
    }
    
    
}
