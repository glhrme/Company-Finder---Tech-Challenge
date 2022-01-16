//
//  HomeViewModel.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 16/01/22.
//

import Foundation

protocol HomeViewDelegete: AnyObject {
    func updateData()
}

protocol HomeCoordinatorDelegate: AnyObject {
    func GoToDetails(_ enterprise: Enterprise)
}

class HomeViewModel {
    var enterprises: Enterprises = .init(enterprises: [])
    lazy var service: HomeService? = HomeService()
    weak var delegate: HomeViewDelegete?
    weak var coordinatorDelegate: HomeCoordinatorDelegate?
    
    func searchEnterprises(_ searchString: String?) {
        service?.fetchEnterprises(searchString ?? "") { result in
            switch result {
            case .success(let enterprises):
                self.updateEnterprises(enterprises)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func goToDetails(_ enterprise: Enterprise) {
        self.coordinatorDelegate?.GoToDetails(enterprise)
    }
    
    private func updateEnterprises(_ enterprises: Enterprises) {
        self.enterprises = enterprises
        self.delegate?.updateData()
    }
}
