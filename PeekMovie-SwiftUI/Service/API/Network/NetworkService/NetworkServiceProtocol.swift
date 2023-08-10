//
//  NetworkServiceProtocol.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 11.08.2023.
//

import Foundation

protocol NetworkService: AnyObject {
    @discardableResult
    func signIn(
        idToken: String,
        completion: @escaping (Result<SocialResponseResponse, HTTPError>) -> Void
    ) -> Cancellable?
}
