//
//  RootView.swift
//  PeekMovie-SwiftUI
//
//  Created by Bekzhan Talgat on 10.08.2023.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    var body: some View {
        
        if appCoordinator.didFinishLoading && appCoordinator.launchScreenIsReady {
            if appCoordinator.isLoggedIn {
//                SessionView()
                Color.blue.ignoresSafeArea()
            } else {
//                LogInView()
                Color.green.ignoresSafeArea()
            }
        } else {
            LaunchView()
                .onAppear {
                    appCoordinator.resovleEntrance()
                }
        }
    }
}

//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        RootView()
//            .environmentObject(AppCoordinator())
//    }
//}

