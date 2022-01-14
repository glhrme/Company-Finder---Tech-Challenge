//
//  HeaderManager.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 14/01/22.
//

import Foundation

enum HeaderList: String {
    case accessToken = "access-token"
    case uid = "uid"
    case client = "client"
}

class HeaderManager {
    static var userDefaults = UserDefaults.standard
    
    static func get(_ header: HeaderList) -> String {
        guard let data = userDefaults.string(forKey: header.rawValue) else { return "" }
        return data
    }
    
    static func set(_ value: String, _ header: HeaderList) {
        userDefaults.set(value, forKey: header.rawValue)
    }
}
