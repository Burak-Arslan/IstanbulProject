

import Foundation
import UIKit
import RxSwift
import RxCocoa

class MainCoordinator: ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    private let navigationControllers: [UINavigationController]
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        self.navigationControllers = Tabs.items
            .map({ (item) -> UINavigationController in
                return item.navigationController
            })
    }
    
    override func start() -> Observable<Void> {
        
        let vc = MainVC()
        vc.tabBar.isTranslucent = false
        vc.viewControllers = navigationControllers
        
        let coordinates = navigationControllers.enumerated()
            .map { (offset, element) -> Observable<Void> in
                guard let items = Tabs(rawValue: offset) else { return Observable.just(() )}
                switch items {
                case .home:
                    return coordinate(to: HomeCoordinator(rootViewController: self.rootViewController, navigationController: element))
                case .notification:
                    return coordinate(to: HomeCoordinator(rootViewController: self.rootViewController, navigationController: element))
                case .busStop :
                    return coordinate(to: HomeCoordinator(rootViewController: self.rootViewController, navigationController: element))
                case .busGarage:
                    return coordinate(to: HomeCoordinator(rootViewController: self.rootViewController, navigationController: element))
                case .busLocation:
                    return coordinate(to: HomeCoordinator(rootViewController: self.rootViewController, navigationController: element))
                }
        }
        
        Observable.merge(coordinates)
            .subscribe()
            .disposed(by: disposeBag)
        
        rootViewController.navigationController!.setNavigationBarHidden(true, animated: true)
        rootViewController.navigationController?.pushViewController(vc, animated: true)
        return  Observable.never()
    }
}
