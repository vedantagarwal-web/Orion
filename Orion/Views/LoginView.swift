//
//  LoginView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Login Information")) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("Password", text: $password)
                }
                
                Section {
                    Button(action: login) {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
            }
            .navigationTitle("Log In")
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func login() {
        guard !email.isEmpty && !password.isEmpty else {
            alertMessage = "Please enter both email and password"
            showingAlert = true
            return
        }
        
        // Simulated user data, since no backend is implemented
        let name = "John Doe" // Placeholder for a user's name; in a real app, this would come from a backend or user input.
        let profileImageUrl = "https://example.com/profile.jpg" // Placeholder URL

        // Call login on the userViewModel with the simulated user data
        userViewModel.login(name: name, email: email, profileImageUrl: profileImageUrl)
        
        // Dismiss the login view after logging in
        presentationMode.wrappedValue.dismiss()
    }
}
