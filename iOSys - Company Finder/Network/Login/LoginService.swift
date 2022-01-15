//
//  LoginService.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import Foundation
import Alamofire

class LoginService {
    func fetchLogin(_ loginModel: LoginModel, completion: @escaping (Result<LoginReponseModel, CustomErrors>) -> Void) {
        AF.request(Utils.makeUrl(.v1, .login), method: .post, parameters: loginModel).responseData { result in
            self.setHeaders(headers: result.response?.allHeaderFields)
            completion(Utils.parse(LoginReponseModel.self, data: result.data))
        }
    }
    
    private func setHeaders(headers: [AnyHashable : Any]?) {
        guard let headers = headers else { return }
        guard let uid = headers[HeaderList.uid.rawValue] as? String,
              let client = headers[HeaderList.client.rawValue] as? String,
              let accessToken = headers[HeaderList.accessToken.rawValue] as? String else { return }
        
        HeaderManager.set(accessToken, .accessToken)
        HeaderManager.set(uid, .uid)
        HeaderManager.set(client, .client)
    }
}
