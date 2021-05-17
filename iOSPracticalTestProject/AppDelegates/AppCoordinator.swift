//
//  AppCoordinator.swift
//  iOSPracticalTestProject
//
//  Created by Moshiur Rahman Bilash on 5/17/21.
//

import UIKit

final class AppCoordinator: Coordinator {    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        let navigationController = UINavigationController()
        let movieListCoordinator = MovieListVCCoordinator(navigationController: navigationController)
        movieListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

    }
}

