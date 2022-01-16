//
//  HeaderManager.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 14/01/22.
//

import Foundation
import Alamofire

enum HeaderList: String {
    case accessToken = "access-token"
    case uid = "uid"
    case client = "client"
}

class HeaderManager {
    static var userDefaults = UserDefaults.standard
    
    static func get(_ header: HeaderList) -> String? {
        return userDefaults.string(forKey: header.rawValue)
    }
    
    static func set(_ value: String, _ header: HeaderList) {
        userDefaults.set(value, forKey: header.rawValue)
    }
    
    static func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        if let authToken = HeaderManager.get(.accessToken), let uid = HeaderManager.get(.uid), let client = HeaderManager.get(.client) {
            headers[HeaderList.accessToken.rawValue] = authToken
            headers[HeaderList.uid.rawValue] = uid
            headers[HeaderList.client.rawValue] = client
        }
        
        return headers
    }
}
