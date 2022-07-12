//
//  URLModel.swift
//  HomeWork
//
//  Created by Chan Jung on 7/12/22.
//

import Foundation

enum Endpoint {
    case users
    case config
}

enum HTTPMethod: String {
    case get = "GET"
    case delete = "DELETE"
    case post = "POST"
    case put = "PUT"
}

protocol URLModeling {
    func makeURLFor(endpoint: Endpoint) -> URL?
    func makeURLRequestFor(endpoint: Endpoint, httpMethod: HTTPMethod) -> URLRequest?
}

struct URLModel: URLModeling {
    private let baseURL: String = "http://hinge-ue1-dev-cli-android-homework.s3-website-us-east-1.amazonaws.com/"
    private let usersEndpoint: String = "users"
    private let configEndpoint: String = "config"
    
    func makeURLFor(endpoint: Endpoint) -> URL? {
        switch endpoint {
        case .config: return URL(string: baseURL + configEndpoint)
        case .users: return URL(string: baseURL + usersEndpoint)
        }
    }
    
    
    /// make URLRequest for a certain endpoint with specified httpMethod, the method will default to GET
    func makeURLRequestFor(endpoint: Endpoint, httpMethod: HTTPMethod = .get) -> URLRequest? {
        guard let url = self.makeURLFor(endpoint: endpoint) else {
            print("unable to make url for \(self.baseURL + self.configEndpoint)")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        return urlRequest
    }
}
