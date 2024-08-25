//
//  WelcomeView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var showingSignUp = false
    @State private var showingLogin = false
    @State private var someStateVariable = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .red]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Text("Welcome to Orion")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    // Apply animation when someStateVariable changes
                    .animation(.easeInOut(duration: 1.0), value: someStateVariable)
                
                VStack(spacing: 20) {
                    Button(action: {
                        withAnimation {
                            showingSignUp = true
                        }
                    }) {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                    .transition(.move(edge: .bottom))
                    
                    Button(action: {
                        withAnimation {
                            showingLogin = true
                        }
                    }) {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white.opacity(0.1))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                    .transition(.move(edge: .bottom))
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
