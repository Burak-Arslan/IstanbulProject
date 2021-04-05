

import Foundation
import RxSwift
class BaseVM {
    
    let showLoading = BehaviorSubject<Bool>(value: false)
    var error = PublishSubject<String>()
}
