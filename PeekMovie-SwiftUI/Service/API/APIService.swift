//
//  ApiService.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

final class APIService {
    
    public var isMockingAll: Bool = false
    
    internal let networkClient: NetworkClient
    internal let networkService: NetworkService
    internal let mockingNetworkService: MockingNetworkServiceImplementation
    
    init() {
        self.networkClient = NetworkClientImplementation(urlSession: .init(configuration: .default))
        self.networkService = NetworkServiceImplementation(networkClient: networkClient)
        self.mockingNetworkService = MockingNetworkServiceImplementation()
    }
}


//  MARK: - Error
extension APIService {
    public enum ServiceError: Error {
        case noAccessToken
        case unknownResponse, internalError
        case imageComressionError, jsonEncodingFailed
    }
}
