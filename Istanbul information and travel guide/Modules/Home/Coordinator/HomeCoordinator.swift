import Foundation
import UIKit
import RxSwift

class HomeCoordinator: ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    private let navigationController: UINavigationController
    
    init(rootViewController: UIViewController,navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }
    
    override func start() -> Observable<Void> {
        let viewController = HomeVC()
        let viewModel = HomeVM()
        viewController.viewModel = viewModel
 
        //push demiyoruz viewcontrollerını setliyoruz
        navigationController.setViewControllers([viewController], animated: true)
        return  Observable.never()
    }
 
}
