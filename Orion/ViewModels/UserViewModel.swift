//
//  UserViewModel.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//


// ViewModels/UserViewModel.swift
import Foundation
import SwiftUI
import Combine

import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var currentUser: User? = nil
    
    func login(name: String, email: String, profileImageUrl: String? = nil) {
        self.currentUser = User(name: name, email: email, profileImageUrl: profileImageUrl)
        self.isLoggedIn = true
    }
    
    func logout() {
        self.currentUser = nil
        self.isLoggedIn = false
    }
    
    func signup(name: String, email: String, password: String) {
        // Simulate sign-up logic; in a real app, you'd interact with a backend service
        let profileImageUrl = "https://example.com/profile.jpg" // Placeholder image URL
        self.currentUser = User(name: name, email: email, profileImageUrl: profileImageUrl)
        self.isLoggedIn = true
    }
}
