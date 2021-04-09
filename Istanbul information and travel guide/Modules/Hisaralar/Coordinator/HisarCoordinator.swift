//
//  HisarCoordinator.swift
//  Istanbul information and travel guide
//
//  Created by Burak Arslan on 9.04.2021.
//

import Foundation
import UIKit
import RxSwift

class HisarCoordinator : ReactiveCoordinator<Void> {
    private let rootViewController: UIViewController
    private let navigationController: UINavigationController
    
    var hisarlar : Camiler?
    
    init(rootViewController: UIViewController,navigationController: UINavigationController, hisarlar : Camiler) {
        self.rootViewController = rootViewController
        self.navigationController = navigationController
        self.hisarlar = hisarlar
    }
    
    override func start() -> Observable<Void> {
        let viewController = HisarVCV()
        viewController.hisarlar = self.hisarlar
        let viewModel = HisarVM()
        viewController.viewModel = viewModel
        self.navigationController.pushViewController(viewController, animated: true)
        return Observable.never()
    }
    
}
