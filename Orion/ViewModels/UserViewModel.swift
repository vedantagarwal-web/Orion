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


class UserViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var currentUser: User? = nil
    @Published var events: [Event] = []  // Holds all events associated with the user
    @Published var notificationsEnabled: Bool = true  // For notification settings

    // Computed property to filter and return only upcoming events
    var upcomingEvents: [Event] {
        events.filter { $0.date > Date() }
    }
    
    // Computed property to filter and return only past events
    var pastEvents: [Event] {
        events.filter { $0.date <= Date() }
    }
    
    func login(name: String, email: String, profileImageUrl: String? = nil) {
        self.currentUser = User(name: name, email: email, profileImageUrl: profileImageUrl)
        self.isLoggedIn = true
        
        // Example: Populate the events array with sample events for the logged-in user
        self.events = [
            Event(
                title: "Concert Night",
                date: Date().addingTimeInterval(86400),
                venue: "Music Hall",
                description: "An electrifying concert night with the best bands in town.",
                price: 50.00,
                image: "concert"
            ),
            Event(
                title: "Drama Night",
                date: Date().addingTimeInterval(172800),
                venue: "City Theater",
                description: "A dramatic evening featuring an award-winning play.",
                price: 35.00,
                image: "drama"
            ),
            Event(
                title: "Past Event",
                date: Date().addingTimeInterval(-86400),
                venue: "Old Arena",
                description: "An event from the past that was a huge success.",
                price: 20.00,
                image: "past_event"
            )
        ]
    }
    
    func logout() {
        self.currentUser = nil
        self.isLoggedIn = false
        self.events = []
    }
    
    func signup(name: String, email: String, password: String) {
        // Simulate sign-up logic; in a real app, you'd interact with a backend service
        let profileImageUrl = "https://example.com/profile.jpg" // Placeholder image URL
        self.currentUser = User(name: name, email: email, profileImageUrl: profileImageUrl)
        self.isLoggedIn = true
        
        // Populate the events array with sample events upon sign-up
        self.events = [
            Event(
                title: "Concert Night",
                date: Date().addingTimeInterval(86400),
                venue: "Music Hall",
                description: "An electrifying concert night with the best bands in town.",
                price: 50.00,
                image: "concert"
            ),
            Event(
                title: "Drama Night",
                date: Date().addingTimeInterval(172800),
                venue: "City Theater",
                description: "A dramatic evening featuring an award-winning play.",
                price: 35.00,
                image: "drama"
            ),
            Event(
                title: "Past Event",
                date: Date().addingTimeInterval(-86400),
                venue: "Old Arena",
                description: "An event from the past that was a huge success.",
                price: 20.00,
                image: "past_event"
            )
        ]
    }
}
