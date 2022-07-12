//
//  NetworkManager.swift
//  HomeWork
//
//  Created by Chan Jung on 7/12/22.
//

import Foundation

final class NetworkRepository: ObservableObject {
    private let urlModel: URLModel = URLModel()
    
    static let shared: NetworkRepository = NetworkRepository()
    
    func getUserData() async throws -> [User] {
        guard let request: URLRequest = urlModel.makeURLRequestFor(endpoint: .users) else {
            print("cannot make request for user")
            throw NetworkManagerError.urlRequestBonked
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            print("data fetched: \(String(decoding: data, as: UTF8.self)) response = \(response.getStatusCode())")
            
            let decoder: JSONDecoder = JSONDecoder()
            let memberData = try decoder.decode(MemberData.self, from: data)
            return memberData.users
        } catch (let error) {
            print("error while getting data: \(error.localizedDescription)")
            throw error
        }
    }
    
    func getProfileOrder() async throws -> [ViewType] {
        guard let request: URLRequest = urlModel.makeURLRequestFor(endpoint: .config) else {
            print("cannot make request for user")
            throw NetworkManagerError.urlRequestBonked
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            print("data fetched: \(String(decoding: data, as: UTF8.self)) response = \(response.getStatusCode())")
            
            let decoder: JSONDecoder = JSONDecoder()
            let profileOrder = try decoder.decode(ProfileOrder.self, from: data)
            return profileOrder.profile
        } catch (let error) {
            print("error while getting data: \(error.localizedDescription)")
            throw error
        }
    }

}

enum NetworkManagerError: Error {
    case urlRequestBonked
}

