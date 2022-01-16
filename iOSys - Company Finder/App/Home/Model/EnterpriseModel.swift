//
//  EnterpriseModel.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 16/01/22.
//

import Foundation

struct Enterprises: Codable {
    let enterprises: [Enterprise]
}

struct Enterprise: Codable {
    let id: Int
    let email_enterprise: String?
    let facebook: String?
    let twitter: String?
    let linkedin: String?
    let phone: String?
    let own_enterprise: Bool
    let enterprise_name: String
    let photo: String
    let description: String
    let city: String
    let country: String
    let value: Int
    let share_price: Float
    let enterprise_type: EnterpriseType
    
    struct EnterpriseType: Codable {
        let id: Int
        let enterprise_type_name: String
    }
}
