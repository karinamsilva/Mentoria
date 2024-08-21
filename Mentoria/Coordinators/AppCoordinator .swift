//
//  AppCoordinator .swift
//  Mentoria
//
//  Created by Karina on 21/07/24.
//

import UIKit

final class AppCoordinator {
    
    private let rootViewController: UINavigationController
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        let controller = SimpleViewController()
        rootViewController.pushViewController(controller, animated: false)
    }

}

class DetailCoordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = DetailViewController()
        navigationController.pushViewController(controller, animated: false)
    }
    
    func navigateToDetail(with list: Character) {
        let controller = DetailViewController()
        UINavigationController().pushViewController(controller, animated: false)
    }

}
