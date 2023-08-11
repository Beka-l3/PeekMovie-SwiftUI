//
//  User.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

struct User {
    let accessToken: String
    
    let id: Int
    let createdDate: Date
    
    let username: String
    let email: String
}

extension User {
    static let zero: User = .init(
        accessToken: "zeroToken",
        id: 0,
        createdDate: Date(timeIntervalSince1970: .zero),
        username: "Zero",
        email: "zero@mail.com"
    )
}
