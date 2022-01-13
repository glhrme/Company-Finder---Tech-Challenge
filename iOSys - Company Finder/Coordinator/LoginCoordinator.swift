//
//  LoginCoordinator.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import UIKit

class LoginCoordinator: CoordinatorProtocol {
    
    var navigation: UINavigationController?
    
    var loginViewController: LoginViewController?
    var loginViewModel: LoginViewModel?
    
    func start() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: getInitial())
        self.navigation = navigation
        return navigation
    }
    
    private func getInitial() -> UIViewController {
        let loginViewModel = LoginViewModel()
        let loginViewController = LoginViewController(loginViewModel)
        self.loginViewModel = loginViewModel
        self.loginViewController = loginViewController
        return loginViewController
    }
}
