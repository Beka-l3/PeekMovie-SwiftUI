//
//  ForgotPasswordNSI.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

extension NetworkServiceImplementation {
//    MARK: - Send verification code
    func forgotPasswordSendVerificationCodeByUsername(username: String, completion: @escaping (Result<Empty, HTTPError>) -> Void) -> Cancellable? {
        guard let request = try? createSendVerificationCodeRequest(credential: username, type: .username) else {
            completion(.failure(.decodingFailed))
            return nil
        }
        
        return networkClient.processRequest(request: request, completion: completion)
    }
    
    func forgotPasswordSendVerificationCodeByEmail(email: String, completion: @escaping (Result<Empty, HTTPError>) -> Void) -> Cancellable? {
        guard let request = try? createSendVerificationCodeRequest(credential: email, type: .email) else {
            completion(.failure(.decodingFailed))
            return nil
        }
        
        return networkClient.processRequest(request: request, completion: completion)
    }
    
    private func createSendVerificationCodeRequest(credential: String, type: VerificationType) throws -> HTTPRequest {
        let data = try encoder.encode( SendVerificationCodeBody(credentials: credential) )
        
        return HTTPRequest(
            route: "",
            headers: getHeader(),
            body: data,
            httpMethod: .post
        )
    }
    
//    MARK: - Verify code
    func verifyPasswordResetCode(code: String, completion: @escaping (Result<ResetPasswordResponse, HTTPError>) -> Void) -> Cancellable? {
        guard let request = try? createSendCodeRequest(code: code) else {
            completion(.failure(.decodingFailed))
            return nil
        }
        
        return networkClient.processRequest(request: request, completion: completion)
    }
    
    private func createSendCodeRequest(code: String) throws -> HTTPRequest {
        let data = try encoder.encode( VerificationCodeBody(code: code) )
        
        return HTTPRequest(
            route: "",
            headers: getHeader(),
            body: data,
            httpMethod: .post
        )
    }
    
    
//    MARK: - Set new password
    func setNewPassword(resetPassword: ResetPassword, newPassword: String, completion: @escaping (Result<Empty, HTTPError>) -> Void) -> Cancellable? {
        guard let request = try? createSetNewPasswordRequest(token: resetPassword.token, newPassword: newPassword) else {
            completion(.failure(.decodingFailed))
            return nil
        }
        
        return networkClient.processRequest(request: request, completion: completion)
    }
    
    private func createSetNewPasswordRequest(token: String, newPassword: String) throws -> HTTPRequest {
        let data = try encoder.encode( NewPasswordBody(newPassword: newPassword) )
        
        return HTTPRequest(
            route: "",
            headers: getHeader(accessToken: token),
            body: data,
            httpMethod: .post
        )
    }
}

