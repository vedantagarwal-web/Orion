import SwiftUI

struct HomeView: View {
    let events = [
        Event(id: UUID(), title: "Summer Music Festival", date: Date().addingTimeInterval(86400 * 30), venue: "Central Park", location: "New York", description: "Annual summer music festival featuring top artists", price: 99.99, image: "event_1", category: "Music"),
        Event(id: UUID(), title: "Tech Conference 2023", date: Date().addingTimeInterval(86400 * 60), venue: "Convention Center", location: "San Francisco", description: "Explore the latest in technology", price: 199.99, image: "event_2", category: "Technology"),
        Event(id: UUID(), title: "Food & Wine Expo", date: Date().addingTimeInterval(86400 * 15), venue: "City Hall", location: "Chicago", description: "Taste the best food and wine from around the world", price: 79.99, image: "event_3", category: "Food")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Featured Events")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(events) { event in
                                EventCard(event: event)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Upcoming Events")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ForEach(events) { event in
                        NavigationLink(destination: EventDetailView(event: event)) {
                            EventRow(event: event)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Discover Events")
        }
    }
}
