//
//  HomePageViewModel.swift
//  HomePage
//
//  Created by Ratchata Nuanchan on 24/11/2565 BE.
//

import Foundation
import RxSwift
import Core

public protocol HomePageProtocolInput {
    func loadAdvertises()
}

public protocol HomePageProtocolOutput {
    var showAdvertisesLoading: PublishSubject<Void> { get set }
    var hideAdvertisesLoading: PublishSubject<Void> { get set }
    var didLoadAdvertisesSuccess: PublishSubject<[Advertise]> { get set }
    var didLoadAdvertisesError: PublishSubject<LMError?> { get set }
    func getAdvertises() -> [Advertise]
    func getHighestRateAdvertises() -> Advertise?
}

public protocol HomePageProtocol: HomePageProtocolInput, HomePageProtocolOutput {
    var input: HomePageProtocolInput { get }
    var output: HomePageProtocolOutput { get }
}

public final class HomePageViewModel: HomePageProtocol {
    public var input: HomePageProtocolInput { return self }
    public var output: HomePageProtocolOutput { return self }
    
    public var showAdvertisesLoading: PublishSubject<Void> = PublishSubject<Void>()
    public var hideAdvertisesLoading: PublishSubject<Void> = PublishSubject<Void>()
    public var didLoadAdvertisesSuccess: PublishSubject<[Advertise]> = PublishSubject<[Advertise]>()
    public var didLoadAdvertisesError: PublishSubject<LMError?> = PublishSubject<LMError?>()
    
    var getAdvertiseUsecase: GetAdvertisesUseCase
    
    private var advertises: [Advertise] = []
    
    fileprivate var disposeBag = DisposeBag()
    
    public init(getAdvertiseUsecase: GetAdvertisesUseCase = GetAdvertisesUseCaseImpl()) {
        self.getAdvertiseUsecase = getAdvertiseUsecase
    }
}

extension HomePageViewModel: HomePageProtocolInput {
    public func loadAdvertises() {
        self.showAdvertisesLoading.onNext(())
        getAdvertiseUsecase.execute().asObservable()
            .subscribe { advertises in
                self.advertises = advertises
                self.didLoadAdvertisesSuccess.onNext(advertises)
            } onError: { error in
                self.didLoadAdvertisesError.onNext(error as? LMError ?? LMError.generic)
            } onCompleted: {
                self.hideAdvertisesLoading.onNext(())
            }
            .disposed(by: disposeBag)

    }
}

extension HomePageViewModel: HomePageProtocolOutput {
    public func getAdvertises() -> [Advertise] {
        return self.advertises
    }
    
    public func getHighestRateAdvertises() -> Advertise? {
        return self.advertises.max { lhs, rhs in
            return lhs.recommended_rate > rhs.recommended_rate
        }
    }
}
