//
//  FilterView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/25/24.
//

import Foundation
import SwiftUI

struct FilterView: View {
    @ObservedObject var viewModel: EventViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedDate = Date()
    @State private var selectedCategory: String?
    @State private var minPrice: Double = 0
    @State private var maxPrice: Double = 1000
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Date")) {
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                }
                
                Section(header: Text("Category")) {
                    ForEach(viewModel.categories, id: \.self) { category in
                        Button(action: { selectedCategory = category }) {
                            HStack {
                                Text(category)
                                Spacer()
                                if selectedCategory == category {
                                    Image(systemName: "checkmark")
                                }
                            }
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
                viewModel.applyFilters(date: selectedDate, category: selectedCategory, minPrice: minPrice, maxPrice: maxPrice)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
