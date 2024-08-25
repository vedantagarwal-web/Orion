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
    @Published var featuredEvents: [Event] = []
    @Published var searchResults: [Event] = []

    init() {
        self.featuredEvents = [
            Event(
                title: "Summer Music Festival",
                date: dateFromString("July 15, 2023"),
                venue: "Central Park",
                description: "A day of great music and fun!",
                price: 59.99,
                image: "event1"
            ),
            Event(
                title: "Tech Conference 2023",
                date: dateFromString("August 5, 2023"),
                venue: "Convention Center",
                description: "Learn about the latest in technology",
                price: 199.99,
                image: "event2"
            ),
            Event(
                title: "Food & Wine Expo",
                date: dateFromString("September 10, 2023"),
                venue: "City Hall",
                description: "Taste the best food and wine from around the world",
                price: 79.99,
                image: "event3"
            )
        ]
    }

    func search(query: String, location: String) {
        if query.isEmpty && location == "All" {
            searchResults = []
        } else {
            searchResults = featuredEvents.filter { event in
                let matchesQuery = event.title.lowercased().contains(query.lowercased()) ||
                                   event.venue.lowercased().contains(query.lowercased()) ||
                                   event.description.lowercased().contains(query.lowercased())
                let matchesLocation = location == "All" || event.venue.lowercased().contains(location.lowercased())
                return matchesQuery && matchesLocation
            }
        }
    }

    private func dateFromString(_ dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"  // Match the format of your date strings
        return formatter.date(from: dateString) ?? Date()  // Fallback to current date if conversion fails
    }
}
