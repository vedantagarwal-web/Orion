//
//  ContentView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

// Views/ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        Group {
            if userViewModel.isLoggedIn {
                MainTabView()
                    .environmentObject(userViewModel)
            } else {
                WelcomeView()
                    .environmentObject(userViewModel)
            }
        }
        .preferredColorScheme(.dark)
    }
}
