//
//  WelcomeView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
// Views/WelcomeView.swift
import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var showingSignUp = false
    @State private var showingLogin = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("Welcome to Orion")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                VStack(spacing: 20) {
                    Button(action: { showingSignUp = true }) {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: { showingLogin = true }) {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 40)
            }
        }
        .sheet(isPresented: $showingSignUp) {
            SignUpView()
        }
        .sheet(isPresented: $showingLogin) {
            LoginView()
        }
    }
}
