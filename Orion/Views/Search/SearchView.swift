import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = EventViewModel()
    @State private var searchText = ""
    @State private var showingFilters = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryBrand.edgesIgnoringSafeArea(.all)
                
                VStack {
                    SearchBar(text: $searchText, placeholder: "Search events...")
                        .padding()
                    
                    HStack {
                        Spacer()
                        Button(action: { showingFilters = true }) {
                            Image(systemName: "slider.horizontal.3")
                                .foregroundColor(.white)
                        }
                        .padding(.trailing)
                    }
                    
                    if searchText.isEmpty {
                        Text("Start searching for events")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        SearchResultsView(events: viewModel.searchResults)
                    }
                }
            }
            .navigationTitle("Search")
            .sheet(isPresented: $showingFilters) {
                FilterView(viewModel: viewModel)
            }
        }
        .onChange(of: searchText) { _ in
            viewModel.searchEvents(query: searchText)
        }
    }
}
