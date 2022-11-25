//
//  GetAdvertisesUseCase.swift
//  HomePage
//
//  Created by Ratchata Nuanchan on 25/11/2565 BE.
//

import Foundation
import RxSwift

public protocol GetAdvertisesUseCase {
    func execute() -> Single<[Advertise]>
}

public class GetAdvertisesUseCaseImpl: GetAdvertisesUseCase {
    
    var repository: AdvertiseRepository
    
    public init(repository: AdvertiseRepository = AdvertiseRepositoryImpl()) {
        self.repository = repository
    }
    
    public func execute() -> Single<[Advertise]> {
        return repository
            .getAdvertises()
            .flatMap { models in
                let mapped = models.map { model in
                    return Advertise.init(model: model)
                }
                return .just(mapped)
            }
    }
    
    
}
