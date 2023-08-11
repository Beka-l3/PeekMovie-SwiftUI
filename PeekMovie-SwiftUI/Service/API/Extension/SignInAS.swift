//
//  APIServiceSignIn.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

//    MARK: - Sign In
extension APIService {
    
//    MARK: - sign in with service
    @discardableResult
    public func signInWithService(type: SignInServiceType, idToken: String, isMocking: Bool = false) async throws -> SocialResponse {
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            guard let self = self else {
                continuation.resume(throwing: ServiceError.internalError)
                return
            }
            
            let _ = ((isMocking || self.isMockingAll) ? mockingNetworkService : networkService).signInWithService(type: type, idToken: idToken) { response in
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
    
//    MARK: - sign in with credentials
    public func signInUsername(_ username: String, isMocking: Bool = false) async throws {
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            guard let self = self else {
                continuation.resume(throwing: ServiceError.internalError)
                return
            }
            
            let _ = ((isMocking || self.isMockingAll) ? mockingNetworkService : networkService).signInUsername(username: username) { response in
                switch response {
                case .success:
                    continuation.resume()
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    public func signInPassword(_ password: String, isMocking: Bool = false) async throws -> User {
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            guard let self = self else {
                continuation.resume(throwing: ServiceError.internalError)
                return
            }
            
            let _ = ((isMocking || self.isMockingAll) ? mockingNetworkService : networkService).signInPassword(password: password) { response in
                switch response {
                case .success(let userResponse):
                    do {
                        let user = try self.unwrapUserResponse(userResponse)
                        continuation.resume(returning: user)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    private func unwrapUserResponse(_ response: UserResponse) throws -> User {
        guard let accessToken = response.accessToken else { throw unwrapUserResponseError.accessTokenError }
        guard let id = response.id else { throw unwrapUserResponseError.idError }
        guard let createdDate = response.createdDate else { throw unwrapUserResponseError.createdDateError }
        guard let username = response.username else { throw unwrapUserResponseError.username }
        guard let email = response.email else { throw unwrapUserResponseError.email }
        
        return .init(accessToken: accessToken, id: id, createdDate: createdDate, username: username, email: email)
    }
}

extension APIService {
    enum unwrapUserResponseError: Error {
        case accessTokenError
        case idError, createdDateError
        case username, email
    }
}
