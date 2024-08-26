import SwiftUI

struct FavoriteEventsView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var favoriteEvents: [Event] = []
    
    var body: some View {
        List {
            ForEach(favoriteEvents) { event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    EventRow(event: event)
                }
            }
            .onDelete(perform: removeEvents)
        }
        .navigationTitle("Favorite Events")
        .listStyle(PlainListStyle())
        .onAppear {
            loadFavoriteEvents()
        }
    }
    
    private func loadFavoriteEvents() {
        // Assuming userViewModel has a method to get favorite events
        favoriteEvents = userViewModel.getFavoriteEvents()
    }
    
    private func removeEvents(at offsets: IndexSet) {
        for index in offsets {
            let event = favoriteEvents[index]
            userViewModel.toggleFavorite(event)
        }
        // Reload favorite events after removal
        loadFavoriteEvents()
    }
}

// Assuming you have an EventRow view, if not, here's a simple implementation:
