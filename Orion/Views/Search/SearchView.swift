import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = EventViewModel()
    @State private var searchText = ""
    @State private var selectedLocation = "All"
    @State private var selectedCategory = "All"
    @State private var minPrice: Double = 0
    @State private var maxPrice: Double = 1000
    @State private var showingFilters = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search events...")
                    .padding()
                
                Picker("Location", selection: $selectedLocation) {
                    ForEach(viewModel.locations, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    Button(action: { showingFilters = true }) {
                        Image(systemName: "slider.horizontal.3")
                        Text("Filters")
                    }
                    .padding(.trailing)
                }
                
                List(viewModel.searchResults) { event in
                    NavigationLink(destination: BookingDetailsView(event: event)) {
                        EventRow(event: event)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .background(Color.primaryBrand.edgesIgnoringSafeArea(.all))
            .navigationTitle("Search")
            .sheet(isPresented: $showingFilters) {
                FilterView(viewModel: viewModel, selectedLocation: $selectedLocation, selectedCategory: $selectedCategory, minPrice: $minPrice, maxPrice: $maxPrice)
            }
        }
        .onChange(of: searchText) { _ in
            viewModel.search(query: searchText, location: selectedLocation)
        }
        .onChange(of: selectedLocation) { _ in
            viewModel.search(query: searchText, location: selectedLocation)
        }
        .onAppear {
            viewModel.search(query: searchText, location: selectedLocation)
        }
    }
}

