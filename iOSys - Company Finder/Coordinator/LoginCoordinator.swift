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
    
    var homeCoordinator: HomeCoordinator?
    
    func start() -> UINavigationController {
        let navigation = UINavigationController(rootViewController: getInitial())
        self.navigation = navigation
        return navigation
    }
    
    private func getInitial() -> UIViewController {
        let loginViewModel = LoginViewModel(self)
        let loginViewController = LoginViewController(loginViewModel)
        self.loginViewModel = loginViewModel
        self.loginViewController = loginViewController
        return loginViewController
    }
    
    private func goToHome() {
        let homeCoordinator = HomeCoordinator()
        self.homeCoordinator = homeCoordinator
        navigation?.pushViewController(homeCoordinator.start(navigation: self.navigation), animated: true)
    }
}

extension LoginCoordinator: LoginDelegate {
    func goHome() {
        self.goToHome()
    }
}
