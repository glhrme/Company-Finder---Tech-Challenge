//
//  LoginViewModel.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import Foundation

protocol LoginDelegate: AnyObject {
    func goHome()
}

class LoginViewModel {
    let service = LoginService()
    let delegate: LoginDelegate
    
    init(_ delegate: LoginDelegate) {
        self.delegate = delegate
    }
    
    func login(email: String, password: String) {
        self.loginRequest(loginModel: .init(email: email, password: password))
    }
    
    // MARK: Requests
    // All private methods
    
    private func loginRequest(loginModel: LoginModel) {
        service.fetchLogin(loginModel) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.delegate.goHome()
            case .failure(let errors):
                print(errors)
            }
        }
    }
}
