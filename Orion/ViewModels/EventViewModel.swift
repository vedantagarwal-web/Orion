//
//  EventViewModel.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI
import Combine

class EventViewModel: ObservableObject {
    @Published var featuredEvents: [Event] = [
        Event(title: "Summer Music Festival", date: "July 15, 2023", venue: "Central Park", description: "A day of great music and fun!", price: 59.99, image: "event1"),
        Event(title: "Tech Conference 2023", date: "August 5, 2023", venue: "Convention Center", description: "Learn about the latest in technology", price: 199.99, image: "event2"),
        Event(title: "Food & Wine Expo", date: "September 10, 2023", venue: "City Hall", description: "Taste the best food and wine from around the world", price: 79.99, image: "event3")
    ]
    
    @Published var searchResults: [Event] = []

    func search(query: String) {
        if query.isEmpty {
            // If the search query is empty, clear the search results.
            searchResults = []
        } else {
            // Filter the featured events based on the search query.
            searchResults = featuredEvents.filter { event in
                event.title.lowercased().contains(query.lowercased()) ||
                event.venue.lowercased().contains(query.lowercased()) ||
                event.description.lowercased().contains(query.lowercased())
            }
        }
    }
}
