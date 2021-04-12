//
//  NotificationCoordinator.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 12.04.2021.
//

import Foundation
import UIKit
import RxSwift

class NotificationCoordinator: ReactiveCoordinator<Void> {
    
    private let rootViewController: UIViewController
    private let navigationController: UINavigationController
    
    init(rootViewController: UIViewController,navigationController: UINavigationController) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
    }
    
    override func start() -> Observable<Void> {
        let viewController = NotificationsVC()
        let viewModel = NotificationVM()
        viewController.viewModel = viewModel
        navigationController.setViewControllers([viewController], animated: true)
        return  Observable.never()
    }
}
