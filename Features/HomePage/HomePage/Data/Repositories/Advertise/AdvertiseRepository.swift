//
//  AdvertiseRepository.swift
//  HomePage
//
//  Created by Ratchata Nuanchan on 25/11/2565 BE.
//

import Foundation
import RxSwift
import Core

public protocol AdvertiseRepository {
    func getAdvertises() -> Single<[AdvertiseModel]>
}

public final class AdvertiseRepositoryImpl: AdvertiseRepository {
    public func getAdvertises() -> Single<[AdvertiseModel]> {
        let request = GetAdvertisesRequest()
        return LMProvider
            .instance
            .request(AdvertiseAPI.getAdvertises(request: request), mapModal: GetAdvertisesResponse.self)
            .flatMap { response in
                guard let advertises = response.data else { return .error(LMError.generic) }
                return .just(advertises)
            }
    }
    
    public init() {}
}
