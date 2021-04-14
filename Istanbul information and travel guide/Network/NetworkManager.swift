//
//  NetworkManager.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 12.04.2021.
//

import Foundation
import Moya
import RxSwift
import RxMoya

struct NetworkManager {

    private let provider = MoyaProvider<IstanbulService>()
    
    static let shared = NetworkManager()
    
    init() {
        
    }
    
    func getNotification() -> Observable<[NotificationResponse]> {
        return request(.getNotification)
    }
    
    func getBusStop() -> Observable<BusStopResponse>{
        return request(.getBusStop)
    }
    
    func request<T: Codable>(_ request: IstanbulService) -> Observable<T> {
        self.provider.rx
            .request(request)
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes().map(T.self)
            .catchError { error in
            return Observable.error(error)
        }
    }
}
