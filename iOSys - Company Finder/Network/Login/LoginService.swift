//
//  LoginService.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import Foundation

class LoginService: Service<LoginAPI> {
    func fetchLogin(_ loginModel: LoginModel, completion: @escaping (Result<LoginReponseModel, Errors>) -> Void) {
        self.request(params: .login(loginModel), model: LoginReponseModel.self) { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
