import Foundation
import Combine

class EventViewModel: ObservableObject {
    @Published var events: [Event] = [
        Event(id: UUID(), title: "Summer Music Festival", date: Date().addingTimeInterval(86400 * 30), venue: "Central Park", location: "New York", description: "Annual summer music festival featuring top artists", price: 99.99, image: "event_1", category: "Music"),
        Event(id: UUID(), title: "Tech Conference 2023", date: Date().addingTimeInterval(86400 * 60), venue: "Convention Center", location: "San Francisco", description: "Explore the latest in technology", price: 199.99, image: "event_2", category: "Technology"),
        Event(id: UUID(), title: "Food & Wine Expo", date: Date().addingTimeInterval(86400 * 15), venue: "City Hall", location: "Chicago", description: "Taste the best food and wine from around the world", price: 79.99, image: "event_3", category: "Food")
    ]
    @Published var searchResults: [Event] = []
    @Published var locations: [String] = ["All", "New York", "San Francisco", "Chicago", "Los Angeles"]
    @Published var categories: [String] = ["All", "Music", "Technology", "Food", "Sports", "Art"]
    
    init() {
        searchResults = events
    }
    
    func search(query: String, location: String) {
        if query.isEmpty && location == "All" {
            searchResults = events
        } else {
            searchResults = events.filter { event in
                let matchesQuery = event.title.lowercased().contains(query.lowercased()) ||
                                   event.description.lowercased().contains(query.lowercased())
                let matchesLocation = location == "All" || event.location == location
                return matchesQuery && matchesLocation
            }
        }
    }
    
    func applyFilters(location: String, category: String, minPrice: Double, maxPrice: Double) {
        searchResults = events.filter { event in
            let matchesLocation = location == "All" || event.location == location
            let matchesCategory = category == "All" || event.category == category
            let matchesPrice = event.price >= minPrice && event.price <= maxPrice
            return matchesLocation && matchesCategory && matchesPrice
        }
        
        print("Applied filters - Location: \(location), Category: \(category), Price range: $\(minPrice)-$\(maxPrice)")
    }
    
    func resetFilters() {
        searchResults = events
    }
}
