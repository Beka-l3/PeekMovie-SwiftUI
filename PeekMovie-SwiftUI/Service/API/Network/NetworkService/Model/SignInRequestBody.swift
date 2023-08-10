//
//  SignInRequestBody.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

struct SignInRequestBody: Codable {
    let socialToken: String
}

struct SocialResponseResponse: Codable {
    let token: String?
    let accountExists: Bool?
}

struct SocialResponse: Codable {
    let token: String
    let accountExists: Bool
}
