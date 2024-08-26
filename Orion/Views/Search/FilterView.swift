import SwiftUI

struct FilterView: View {
    @ObservedObject var viewModel: EventViewModel
    @Binding var selectedLocation: String
    @Binding var selectedCategory: String
    @Binding var minPrice: Double
    @Binding var maxPrice: Double
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Location")) {
                    Picker("Location", selection: $selectedLocation) {
                        ForEach(viewModel.locations, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(viewModel.categories, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("Price Range")) {
                    HStack {
                        Text("$\(Int(minPrice))")
                        Slider(value: $minPrice, in: 0...maxPrice)
                        Text("$\(Int(maxPrice))")
                    }
                    HStack {
                        Text("$\(Int(maxPrice))")
                        Slider(value: $maxPrice, in: minPrice...1000)
                        Text("$1000")
                    }
                }
            }
            .navigationTitle("Filters")
            .navigationBarItems(trailing: Button("Apply") {
                viewModel.applyFilters(location: selectedLocation, category: selectedCategory, minPrice: minPrice, maxPrice: maxPrice)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
