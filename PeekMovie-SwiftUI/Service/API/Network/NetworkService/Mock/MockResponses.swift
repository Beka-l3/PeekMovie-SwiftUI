//
//  MockResponses.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

// Mock Response Data
struct MRData {
    
}

struct MRSocialResponse {
    static let success: SocialResponseResponse = .init(
        token: "mockingSocialResponseToken",
//        accountExists: Bool.random()
        accountExists: true
    )
}

struct MRResetPasswordResponse {
    static let success: ResetPasswordResponse = .init(
        token: "mockingResetPasswordResponseToken"
    )
}



