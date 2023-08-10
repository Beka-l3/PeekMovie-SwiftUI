//
//  MockingNetworkServiceImplementation.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

final class MockingNetworkServiceImplementation: NetworkService {
    func signIn(
        idToken: String,
        completion: @escaping (Result<SocialResponseResponse, HTTPError>) -> Void
    ) -> Cancellable? {
        let response = MRSocialResponse().success
              
        MockingNetworkServiceImplementation.executeCompletionOnMainThread {
            completion(.success(response))
        }
        
        return nil
    }
    
//    MARK: - private
    private static func executeCompletionOnMainThread(_ closure: @escaping () -> Void) {
        DispatchQueue.main.async {
            closure()
        }
    }
}
