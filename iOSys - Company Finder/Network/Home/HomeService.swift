//
//  HomeService.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 16/01/22.
//

import Foundation
import Alamofire

class HomeService {
    func fetchEnterprises(_ name: String, completion: @escaping (Result<Enterprises, CustomErrors>) -> Void) {
        AF.request(Utils.makeUrl(.v1, .enterprises(name: name)), headers: HeaderManager.headers()).responseData { result in
            completion(Utils.parse(Enterprises.self, data: result.data))
        }
    }
}
