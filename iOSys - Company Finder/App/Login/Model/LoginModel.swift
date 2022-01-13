//
//  LoginModel.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import Foundation

struct LoginModel {
    let email: String
    let password: String
}

struct LoginReponseModel: Codable {
    let investor: Investor
    let enterprise: String?
    let success: Bool
    
    struct Investor: Codable {
        let id: Int
        let investorName: String
    }
}
