//
//  StartViewRepresentable.swift
//  Mentoria
//
//  Created by Karina on 21/07/24.
//

import SwiftUI

struct MentoriaViewRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let navigationController = UINavigationController()
        let coordinator = AppCoordinator(rootViewController: navigationController)
        coordinator.start()
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
}

