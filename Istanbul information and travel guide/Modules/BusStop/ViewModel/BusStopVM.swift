//
//  BusStopVM.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 13.04.2021.
//

import Foundation
import RxCocoa
import RxSwift

class BusStopVM: BaseVM {
    let disposeBag = DisposeBag()
    
    var busStopInfo = PublishSubject<[BusStopResponse]>()


    func getBusStop(){
        NetworkManager.shared.getBusStop().subscribe(onNext: { data in
            self.busStopInfo.onNext(data)
            }, onError: { error in
                self.error.onNext(error.localizedDescription)
            }, onCompleted: {
                print("onCompleted")
            }).disposed(by: disposeBag)
    }
}

