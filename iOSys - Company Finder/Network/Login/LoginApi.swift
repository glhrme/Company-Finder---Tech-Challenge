//
//  LoginApi.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import Foundation

enum LoginAPI {
    case login(LoginModel)
}

extension LoginAPI: ServiceProtocol {
    var version: Versions {
        return .v1
    }
    
    var url: String {
        switch self {
        case .login:
            return "/users/auth/sign_in"
        }
    }
    
    var body: Data? {
        switch self {
        case .login:
            return nil
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .login:
            return .post
        }
    }
}
