import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = EventViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryBrand.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        SearchBar(text: $searchText, placeholder: "Search events...")
                            .padding(.horizontal)
                        
                        Text("Featured Events")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(viewModel.featuredEvents) { event in
                                    NavigationLink(destination: EventDetailView(event: event)) {
                                        FeaturedEventCard(event: event)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        Text("Upcoming Events")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        ForEach(viewModel.upcomingEvents) { event in
                            NavigationLink(destination: EventDetailView(event: event)) {
                                EventRow(event: event)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Orion")
            .navigationBarTitleDisplayMode(.large)
        }
        .onAppear {
            viewModel.fetchEvents()
        }
    }
}
