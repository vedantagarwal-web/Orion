import Foundation
import Combine

class EventViewModel: ObservableObject {
    @Published var events: [Event] = [
        Event(id: UUID(), title: "KL Music Festival", date: Date().addingTimeInterval(86400 * 30), venue: "KLCC Park", location: "Kuala Lumpur", description: "Annual music festival featuring top Malaysian and international artists", price: 199.99, image: "event_music", category: "Music"),
        Event(id: UUID(), title: "Tech Summit 2023", date: Date().addingTimeInterval(86400 * 60), venue: "Kuala Lumpur Convention Centre", location: "Kuala Lumpur", description: "Explore the latest in Malaysian and global technology", price: 499.99, image: "event_tech", category: "Technology"),
        Event(id: UUID(), title: "Penang Food Festival", date: Date().addingTimeInterval(86400 * 15), venue: "George Town", location: "Penang", description: "Taste the best of Penang's world-renowned cuisine", price: 79.99, image: "event_food", category: "Food")
    ]
    @Published var searchResults: [Event] = []
    @Published var locations: [String] = ["All", "Kuala Lumpur", "Penang", "Johor Bahru", "Kota Kinabalu", "Kuching", "Malacca", "Ipoh"]
    @Published var categories: [String] = ["All", "Music", "Technology", "Food", "Sports", "Art", "Culture"]
    
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
        
        print("Applied filters - Location: \(location), Category: \(category), Price range: \(CurrencyFormatter.formatPrice(minPrice))-\(CurrencyFormatter.formatPrice(maxPrice))")
    }
    
    func resetFilters() {
        searchResults = events
    }
}
