//
//  MockingNetworkServiceImplementation.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

final class MockingNetworkServiceImplementation: NetworkService {
    private static func executeCompletionOnMainThread(_ closure: @escaping () -> Void) {
        DispatchQueue.main.async {
            closure()
        }
    }
}

// MARK: - sign in
extension MockingNetworkServiceImplementation {
    func signInWithService(
        type: SignInServiceType,
        idToken: String,
        completion: @escaping (Result<SocialResponseResponse, HTTPError>) -> Void
    ) -> Cancellable? {
        let response = MRSocialResponse.success
        
        MockingNetworkServiceImplementation.executeCompletionOnMainThread {
            completion(.success(response))
        }
        
        return nil
    }
    
    
    func signInUsername(username: String, completion: @escaping (Result<Empty, HTTPError>) -> Void) -> Cancellable? {
        let response = Empty()
        
        MockingNetworkServiceImplementation.executeCompletionOnMainThread {
            completion(.success(response))
        }
        
        return nil
    }
    
    func signInPassword(password: String, completion: @escaping (Result<UserResponse, HTTPError>) -> Void) -> Cancellable? {
        let response = MRUserResponse.success
        
        MockingNetworkServiceImplementation.executeCompletionOnMainThread {
            completion(.success(response))
        }
        
        return nil
    }
}

// MARK: - forgot password
extension MockingNetworkServiceImplementation {
    func forgotPasswordSendVerificationCodeByUsername(username: String, completion: @escaping (Result<Empty, HTTPError>) -> Void) -> Cancellable? {
        let response = Empty()
              
        MockingNetworkServiceImplementation.executeCompletionOnMainThread {
            completion(.success(response))
        }
        
        return nil
    }
    
    func forgotPasswordSendVerificationCodeByEmail(email: String, completion: @escaping (Result<Empty, HTTPError>) -> Void) -> Cancellable? {
        let response = Empty()
              
        MockingNetworkServiceImplementation.executeCompletionOnMainThread {
            completion(.success(response))
        }
        
        return nil
    }
    
    func verifyPasswordResetCode(code: String, completion: @escaping (Result<ResetPasswordResponse, HTTPError>) -> Void) -> Cancellable? {
        let response = MRResetPasswordResponse.success
        
        MockingNetworkServiceImplementation.executeCompletionOnMainThread {
            completion(.success(response))
        }
        
        return nil
    }
    
    func setNewPassword(resetPassword: ResetPassword, newPassword: String, completion: @escaping (Result<Empty, HTTPError>) -> Void) -> Cancellable? {
        let response = Empty()
              
        MockingNetworkServiceImplementation.executeCompletionOnMainThread {
            completion(.success(response))
        }
        
        return nil
    }
}
