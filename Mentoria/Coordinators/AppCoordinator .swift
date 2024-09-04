//
//  AppCoordinator .swift
//  Mentoria
//
//  Created by Karina on 21/07/24.
//

import UIKit

final class AppCoordinator {
    
    private let rootViewController: UINavigationController
    
    private var detailCoordinator: DetailCoordinator?
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        let controller = MainViewController(detailCoordinator: self)
        controller.title = "Characters"
        rootViewController.pushViewController(controller, animated: false)
    }
    
    func showDetailController(wtih list: Character) {
        if detailCoordinator == nil {
            detailCoordinator = DetailCoordinator(navigationController: rootViewController)
        }
        guard let coordinator = detailCoordinator else {
            return
        }
        coordinator.navigateToDetail(with: list)
    }

}

class DetailCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func navigateToDetail(with list: Character) {
        let viewModel = DetailViewModel(character: list)
        let controller = DetailViewController(viewModel: viewModel)
        navigationController.pushViewController(controller, animated: true)
    }
}
