//
//  NetworkServiceImplementation.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

final class NetworkServiceImplementation: NetworkService {
    
    internal let networkClient: NetworkClient
    internal let encoder: JSONEncoder
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
        self.encoder = .init()
    }
    
    internal func getHeader(accessToken: String? = nil) -> [String : String] {
        var headers: [String: String] = [:]
        headers["Content-Type"] = "application/json"
        
        if let accessToken = accessToken {
            headers["access-token"] = accessToken
        }
        
        return headers
    }
}
