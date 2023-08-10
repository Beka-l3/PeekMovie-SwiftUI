//
//  NetworkServiceImplementation.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

final class NetworkServiceImplementation: NetworkService {
    
    private let networkClient: NetworkClient
    private let encoder: JSONEncoder
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
        self.encoder = .init()
    }
    
//    MARK: - signIn
    func signIn(
        idToken: String,
        completion: @escaping (Result<SocialResponseResponse, HTTPError>) -> Void
    ) -> Cancellable? {
        guard let request = try? createSignInRequest(idToken: idToken) else {
            completion(.failure(.decodingFailed))
            return nil
        }
        
        return networkClient.processRequest(request: request, completion: completion)
    }
    
    private func createSignInRequest(idToken: String) throws -> HTTPRequest {
        let data = try encoder.encode(SignInRequestBody(socialToken: idToken))
        
        return HTTPRequest(
            route: "",
            headers: getHeader(),
            body: data,
            httpMethod: .post
        )
    }
    
//    MARK: - private
    private func getHeader(accessToken: String? = nil) -> [String : String] {
        var headers: [String: String] = [:]
        headers["Content-Type"] = "application/json"
        
        if let accessToken = accessToken {
            headers["access-token"] = accessToken
        }
        
        return headers
    }
    
}
