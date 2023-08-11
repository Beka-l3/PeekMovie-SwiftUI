//
//  ForgotPasswordREsponses.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

struct ResetPasswordResponse: Decodable {
    let token: String?
}

struct ResetPassword {
    let token: String
}

struct SendVerificationCodeBody: Encodable {
    let credentials: String
}

struct VerificationCodeBody: Encodable {
    let code: String
}

struct NewPasswordBody: Encodable {
    let newPassword: String
}

enum VerificationType {
    case username, email
}
