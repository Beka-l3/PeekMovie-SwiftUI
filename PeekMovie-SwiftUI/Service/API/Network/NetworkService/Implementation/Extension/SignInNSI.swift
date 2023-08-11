//
//  SignInNSI.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation


extension NetworkServiceImplementation {
//    MARK: - Sign in with services
    func signInWithService(
        type: SignInServiceType,
        idToken: String,
        completion: @escaping (Result<SocialResponseResponse, HTTPError>) -> Void
    ) -> Cancellable? {
        guard let request = try? createSignInWithServiceRequest(idToken: idToken, type: type) else {
            completion(.failure(.decodingFailed))
            return nil
        }
        
        return networkClient.processRequest(request: request, completion: completion)
    }
    
    private func createSignInWithServiceRequest(idToken: String, type: SignInServiceType) throws -> HTTPRequest {
        let data = try encoder.encode(SignInWithServiceRequestBody(socialToken: idToken))
        
        return HTTPRequest(
            route: "",
            headers: getHeader(),
            body: data,
            httpMethod: .post
        )
    }
    
//    MARK: - Sign in with credentials
    func signInUsername(username: String, completion: @escaping (Result<Empty, HTTPError>) -> Void) -> Cancellable? {
        guard let request = try? createSignInWithCredentialsRequest(credential: username, type: .username) else {
            completion(.failure(.decodingFailed))
            return nil
        }
        
        return networkClient.processRequest(request: request, completion: completion)
    }
    
    func signInPassword(password: String, completion: @escaping (Result<UserResponse, HTTPError>) -> Void) -> Cancellable? {
        guard let request = try? createSignInWithCredentialsRequest(credential: password, type: .password) else {
            completion(.failure(.decodingFailed))
            return nil
        }
        
        return networkClient.processRequest(request: request, completion: completion)
    }
    
    private func createSignInWithCredentialsRequest(credential: String, type: CredentialType) throws -> HTTPRequest {
        let data = try encoder.encode(SignInWithCredentialRequestBody(credential: credential))
        
        return HTTPRequest(
            route: "",
            headers: getHeader(),
            body: data,
            httpMethod: .post
        )
    }
}

