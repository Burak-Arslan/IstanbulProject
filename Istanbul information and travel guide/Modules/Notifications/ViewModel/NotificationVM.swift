//
//  NotificationVM.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 12.04.2021.
//

import Foundation
import RxCocoa
import RxSwift

class NotificationVM: BaseVM {
    let disposeBag = DisposeBag()
    
    var notificationInfo = PublishSubject<[NotificationResponse]>()


    func getNotification(){
        self.showLoading.onNext(true)
        NetworkManager.shared.getNotification().subscribe(onNext: { data in
            self.notificationInfo.onNext(data)
            }, onError: { error in
                self.showLoading.onNext(false)
                self.error.onNext(error.localizedDescription)
            }, onCompleted: {
                self.showLoading.onNext(false)
                print("onCompleted")
            }).disposed(by: disposeBag)
    }
}
