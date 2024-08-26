import SwiftUI

struct HomeView: View {
    let events = [
        Event(id: UUID(),
              title: "KL Music Festival",
              date: Date().addingTimeInterval(86400 * 30),
              venue: "KLCC Park",
              location: "Kuala Lumpur",
              description: "Annual music festival featuring top Malaysian and international artists",
              price: 299.99,
              image: "event_music",
              category: "Music"),
        Event(id: UUID(),
              title: "Malaysia Tech Week",
              date: Date().addingTimeInterval(86400 * 60),
              venue: "Kuala Lumpur Convention Centre",
              location: "Kuala Lumpur",
              description: "Explore the latest in Malaysian and global technology",
              price: 599.99,
              image: "event_tech",
              category: "Technology"),
        Event(id: UUID(),
              title: "Penang Food Festival",
              date: Date().addingTimeInterval(86400 * 15),
              venue: "George Town",
              location: "Penang",
              description: "Taste the best of Penang's world-renowned cuisine",
              price: 149.99,
              image: "event_food",
              category: "Food")
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
