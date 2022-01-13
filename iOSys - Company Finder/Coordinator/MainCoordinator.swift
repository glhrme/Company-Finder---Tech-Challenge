//
//  MainCoordinator.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import UIKit

protocol CoordinatorProtocol {
    func start() -> UINavigationController
}

class MainCoordinator {
    let window: UIWindow
    let initialCoordinator: CoordinatorProtocol
    
    init(_ window: UIWindow, _ coordinator: CoordinatorProtocol) {
        self.window = window
        self.initialCoordinator = coordinator
    }
    
    func start() {
        window.rootViewController = initialCoordinator.start()
        window.makeKeyAndVisible()
    }
}
