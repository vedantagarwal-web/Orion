import SwiftUI
import Foundation

struct SearchView: View {
    @State private var searchText = ""
    @State private var selectedLocation = "All"
    @StateObject private var viewModel = EventViewModel()
    
    let locations = ["All", "Kuala Lumpur", "Penang", "Johor Bahru", "Ipoh"] // Add more locations as needed
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Location", selection: $selectedLocation) {
                    ForEach(locations, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                TextField("Search events...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List(viewModel.searchResults) { event in
                    NavigationLink(destination: BookingDetailsView(event: event)) {
                        EventCard(event: event)
                    }
                }
            }
            .background(Color.black)
            .navigationTitle("Search")
        }
        .onChange(of: searchText) { _ in
            viewModel.search(query: searchText, location: selectedLocation)
        }
        .onChange(of: selectedLocation) { _ in
            viewModel.search(query: searchText, location: selectedLocation)
        }
    }
}
