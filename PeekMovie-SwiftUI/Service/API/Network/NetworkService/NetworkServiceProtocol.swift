//
//  NetworkServiceProtocol.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

protocol NetworkService: AnyObject {
//    MARK: - Sign In
    @discardableResult
    func signInWithService(
        type: SignInServiceType,
        idToken: String,
        completion: @escaping (Result<SocialResponseResponse, HTTPError>) -> Void
    ) -> Cancellable?
    
    @discardableResult
    func signInUsername(
        username: String,
        completion: @escaping (Result<Empty, HTTPError>) -> Void
    ) -> Cancellable?
    
    @discardableResult
    func signInPassword(
        password: String,
        completion: @escaping (Result<UserResponse, HTTPError>) -> Void
    ) -> Cancellable?
    
    @discardableResult
    func forgotPasswordSendVerificationCodeByUsername(
        username: String,
        completion: @escaping (Result<Empty, HTTPError>) -> Void
    ) -> Cancellable?
    
    @discardableResult
    func forgotPasswordSendVerificationCodeByEmail(
        email: String,
        completion: @escaping (Result<Empty, HTTPError>) -> Void
    ) -> Cancellable?
    
    @discardableResult
    func verifyPasswordResetCode(
        code: String,
        completion: @escaping (Result<ResetPasswordResponse, HTTPError>) -> Void
    ) -> Cancellable?
    
    @discardableResult
    func setNewPassword(
        resetPassword: ResetPassword,
        newPassword: String,
        completion: @escaping (Result<Empty, HTTPError>) -> Void
    ) -> Cancellable?
    
//    MARK: -
}
