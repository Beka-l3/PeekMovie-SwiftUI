//
//  SignInRequestBody.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

enum SignInServiceType {
    case google, apple
}

enum CredentialType {
    case username, password
}

struct SignInWithServiceRequestBody: Encodable {
    let socialToken: String
}

struct SignInWithCredentialRequestBody: Encodable {
    let credential: String
}

struct SocialResponseResponse: Decodable {
    let token: String?
    let accountExists: Bool?
}

struct SocialResponse {
    let token: String
    let accountExists: Bool
}

struct UserResponse: Decodable {
    let accessToken: String?
    
    let id: Int?
    let createdDate: Date?
    
    let username: String?
    let email: String?
}


