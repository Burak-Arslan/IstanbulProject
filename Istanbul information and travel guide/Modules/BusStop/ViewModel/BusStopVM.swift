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
    
    var busStopInfo = PublishSubject<BusStopResponse>()


    func getBusStop(){
        showLoading.onNext(true)
        NetworkManager.shared.getBusStop().subscribe(onNext: { data in
            self.busStopInfo.onNext(data)
            }, onError: { error in
                self.showLoading.onNext(false)
                self.error.onNext(error.localizedDescription)
            }, onCompleted: {
                self.showLoading.onNext(false)
                print("onCompleted")
            }).disposed(by: disposeBag)
    }
}

