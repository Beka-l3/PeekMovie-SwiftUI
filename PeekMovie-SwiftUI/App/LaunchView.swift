//
//  LaunchView.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 10.08.2023.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    var body: some View {
        VStack(spacing: 8) {
            ProgressView()
            
            Text("Waiting for the app to be ready...")
                .font(.caption)
        }
        .onAppear {
            Task {
                sleep(3)
                setLaunchScreenToReady()
            }
        }
    }
    
    @MainActor func setLaunchScreenToReady() {
        appCoordinator.launchScreenIsReady = true
    }}

//struct LaunchView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchView()
//    }
//}
