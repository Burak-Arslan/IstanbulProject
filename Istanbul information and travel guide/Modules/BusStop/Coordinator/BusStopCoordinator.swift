//
//  BusStopCoordinator.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 13.04.2021.
//

import Foundation
import UIKit
import RxSwift

class BusStopCoordinator: ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    private let navigationController: UINavigationController
    
    init(rootViewController: UIViewController,navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }
    
    override func start() -> Observable<Void> {
        let viewController = BusStopVC()
        let viewModel = BusStopVM()
        viewController.viewModel = viewModel
        navigationController.setViewControllers([viewController], animated: true)
        return  Observable.never()
    }
}
