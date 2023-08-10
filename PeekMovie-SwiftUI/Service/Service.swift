//
//  Service.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

final class Service {
    
    /// Backend API
    static let api: APIService = .init()
    
}

extension Service {
    enum ServiceError: Error {
        case noData
    }
}
