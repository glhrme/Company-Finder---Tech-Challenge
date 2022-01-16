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

class HomeViewModel {
    var enterprises: Enterprises?
    lazy var service: HomeService? = HomeService()
    weak var delegate: HomeViewDelegete?
    
    func searchEnterprises() {
        service?.fetchEnterprises { result in
            switch result {
            case .success(let enterprises):
                self.updateEnterprises(enterprises)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func updateEnterprises(_ enterprises: Enterprises) {
        self.enterprises = enterprises
        self.delegate?.updateData()
    }
}
