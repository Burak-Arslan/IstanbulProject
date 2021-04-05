

import Foundation
import UIKit
import RxSwift
import RxCocoa

class MainCoordinator: ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    

    override func start() -> Observable<Void> {
        let viewController = MainVC()
        let viewModel = MainVM()
        viewController.viewModel = viewModel
        
        self.rootViewController.navigationController?.pushViewController(viewController, animated: true)
        return  Observable.never()
    }
}
