import Foundation
import Combine

class EventViewModel: ObservableObject {
    @Published var featuredEvents: [Event] = []
    @Published var upcomingEvents: [Event] = []
    @Published var searchResults: [Event] = []
    @Published var categories: [String] = ["Music", "Sports", "Arts", "Food", "Technology"]
    
    private var allEvents: [Event] = []
    private var cancellables = Set<AnyCancellable>()
    
    func fetchEvents() {
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // In a real app, fetch events from a server
            self.allEvents = [
                Event(title: "Summer Music Festival", date: Date().addingTimeInterval(86400 * 30), venue: "Central Park", description: "Annual summer music festival featuring top artists", price: 99.99, image: "summer_festival"),
                Event(title: "Tech Conference 2023", date: Date().addingTimeInterval(86400 * 60), venue: "Convention Center", description: "Explore the latest in technology", price: 199.99, image: "tech_conference"),
                // Add more sample events...
            ]
            
            self.featuredEvents = Array(self.allEvents.prefix(5))
            self.upcomingEvents = self.allEvents.filter { $0.date > Date() }.sorted { $0.date < $1.date }
        }
    }
    
    func searchEvents(query: String) {
        guard !query.isEmpty else {
            searchResults = []
            return
        }
        
        searchResults = allEvents.filter { event in
            event.title.lowercased().contains(query.lowercased()) ||
            event.description.lowercased().contains(query.lowercased()) ||
            event.venue.lowercased().contains(query.lowercased())
        }
    }
    
    func applyFilters(date: Date, category: String?, minPrice: Double, maxPrice: Double) {
        searchResults = allEvents.filter { event in
            let dateMatches = Calendar.current.isDate(event.date, inSameDayAs: date)
            let categoryMatches = category == nil || event.title.contains(category!) // Assuming category is part of the title for simplicity
            let priceInRange = event.price >= minPrice && event.price <= maxPrice
            
            return dateMatches && categoryMatches && priceInRange
        }
    }
}
