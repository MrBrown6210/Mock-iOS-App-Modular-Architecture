//
//  LMProvider.swift
//  Core
//
//  Created by Ratchata Nuanchan on 25/11/2565 BE.
//

import Foundation
import Moya
import RxSwift

public struct LMProvider {
    public static let instance = LMProvider()
    fileprivate let provider: MoyaProvider<MultiTarget>
    
    public init() {
        self.provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin()])
    }
}

extension LMProvider {
    public func request<T: TargetType, C: Decodable>(_ t: T, mapModal: C.Type, isRefreshToken: Bool = true) -> Single<C> {
        return provider
            .rx
            .request(MultiTarget(t))
            .flatMap ({ (response) in
                if isRefreshToken, response.statusCode == 401 {
                    throw LMError.refreshTokenInvalid
                } else {
                    return .just(response)
                }
            })
            .map(mapModal.self)
            .catch { e in
                print(e.localizedDescription)
                return Single.error(e)
            }
    }
}
