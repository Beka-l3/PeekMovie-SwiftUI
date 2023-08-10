//
//  PeekMovie_SwiftUIApp.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 10.08.2023.
//

import SwiftUI

@main
struct PeekMovie_SwiftUIApp: App {
    let appCoordinator: AppCoordinator = .init()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
