//
//  Utils.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 13/01/22.
//

import Foundation

enum Base_URL: String {
    case v1 = "https://empresas.ioasys.com.br/api/v1"
}

enum Paths {
    case login
    case enterprises(name: String)
}

enum CustomErrors: Error {
    case parse
    case dataIsNull
}

class Utils {
    static func makeUrl(_ base: Base_URL, _ path: Paths) -> String {
        switch path {
        case .login:
            return Utils.makeString(base.rawValue, "/users/auth/sign_in")
        case .enterprises(let name):
            return Utils.makeString(base.rawValue, "/enterprises?name=\(name)")
        }
    }
    
    private static func makeString(_ base: String, _ path: String) -> String {
        return base + path
    }
    
    static func parse<U: Codable>(_ model: U.Type, data: Data?) -> Result<U, CustomErrors> {
        let decoder = JSONDecoder()
        
        do {
            guard let data = data else { return .failure(.dataIsNull) }
            let decoded = try decoder.decode(model, from: data)
            return .success(decoded)
        } catch(let error) {
            print(error)
            return .failure(.parse)
        }
    }
}
