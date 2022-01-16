//
//  HomeCoordinator.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 14/01/22.
//

import UIKit

class HomeCoordinator {
    var navigation: UINavigationController?
    
    var homeViewController: HomeViewController?
    var homeViewModel: HomeViewModel?
    
    func start(navigation: UINavigationController?) -> UIViewController {
        self.navigation = navigation
        self.navigation?.viewControllers = []
        return getInitial()
    }
    
    private func getInitial() -> UIViewController {
        let homeViewModel = HomeViewModel()
        self.homeViewModel = homeViewModel
        let homeViewController = HomeViewController(homeViewModel)
        self.homeViewController = homeViewController
        return homeViewController
    }
    
}
