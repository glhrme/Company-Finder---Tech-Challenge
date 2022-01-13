//
//  LoginViewModel.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import Foundation

class LoginViewModel {
    let service = LoginService()
    
    func login(email: String, password: String) {
        self.loginRequest(loginModel: .init(email: email, password: password))
    }
    
    // MARK: Requests
    // All private methods
    
    private func loginRequest(loginModel: LoginModel) {
        service.fetchLogin(loginModel) { [weak self] (result) in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                print(response)
            case .failure(let errors):
                print(errors)
            }
        }
    }
}
