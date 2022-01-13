//
//  ServiceManager.swift
//  iOSys - Company Finder
//
//  Created by Guilherme de Assis dos Santos on 12/01/22.
//

import Foundation

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
}

protocol ServiceProtocol {
    var url: String { get }
    var body: Data? { get }
    var method: HttpMethod { get }
}

protocol ServiceManagerProtocol {
    func request(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

enum Errors: Error {
    case unknown
    case error(Error)
    case parse(Error)
    case invalidRequest
    case dataIsNull
}

class ServiceManager: ServiceManagerProtocol {
    func request(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: request, completionHandler: completion).resume()
    }
}

class Service<T: ServiceProtocol> {
    let requester: ServiceManagerProtocol
    
    init(_ requester: ServiceManagerProtocol) {
        self.requester = requester
    }
    
    func request(params: T, completion: @escaping (Result<Data, Errors>) -> Void) {
        guard let urlRequest = self.makeRequest(params) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        requester.request(request: urlRequest) { data, response, error in
            if let data = data, error == nil {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(.error(error)))
            } else {
                completion(.failure(.unknown))
            }
        }
    }
    
    func request<U: Codable>(params: T, model: U.Type, completion: @escaping (Result<U, Errors>) -> Void){
        guard let urlRequest = self.makeRequest(params) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        requester.request(request: urlRequest) { data, response, error in
            if let data = data, error == nil {
                completion(self.parse(data: data, model: model))
            } else if let error = error {
                completion(.failure(.error(error)))
            } else {
                completion(.failure(.unknown))
            }
        }
    }
    
    private func makeRequest(_ params: T) -> URLRequest? {
        // TODO
        return nil
    }
    
    private func parse<U: Codable>(data: Data?, model: U.Type) -> Result<U, Errors> {
        let decoder = JSONDecoder()
        
        do {
            guard let data = data else { return .failure(.dataIsNull) }
            let decoded = try decoder.decode(model, from: data)
            return .success(decoded)
        } catch {
            return .failure(.parse(error))
        }
    }
}