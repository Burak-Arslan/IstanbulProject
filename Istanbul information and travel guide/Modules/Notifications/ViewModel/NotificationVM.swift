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
        NetworkManager.shared.getNotification().subscribe(onNext: { data in
            self.notificationInfo.onNext(data)
            }, onError: { error in
                self.error.onNext(error.localizedDescription)
            }, onCompleted: {
                print("onCompleted")
            }).disposed(by: disposeBag)
    }
}
