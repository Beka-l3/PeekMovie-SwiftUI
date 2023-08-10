//
//  APIServiceSignIn.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

//    MARK: - Sign In
extension APIService {
    
    @discardableResult
    public func signIn(idToken: String, isMocking: Bool = false) async throws -> SocialResponse {
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            guard let self = self else {
                continuation.resume(throwing: ServiceError.internalError)
                return
            }
            
            let _ = ((isMocking || self.isMockingAll) ? mockingNetworkService : networkService).signIn(idToken: idToken) { response in
                switch response {
                case .success(let data):
                    if let token = data.token, let accountExists = data.accountExists {
                        continuation.resume(returning: .init(token: token, accountExists: accountExists))
                    } else {
                        continuation.resume(throwing: ServiceError.unknownResponse)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
}
