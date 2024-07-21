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
