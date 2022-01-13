//
//  LoginCoordinator.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import UIKit

class LoginCoordinator: CoordinatorProtocol {
    
    var navigation: UINavigationController?
    
    func start() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: UIViewController())
        self.navigation = navigation
        return navigation
    }
}
