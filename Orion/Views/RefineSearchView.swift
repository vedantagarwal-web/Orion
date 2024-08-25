//
//  RefineSearchView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI


struct RefineSearchView: View {
    @State private var selectedLocation = "Use GPS"
    @State private var selectedDate = Date()
    @State private var selectedGenre: Set<String> = []
    @State private var lowerPrice: Double = 50
    @State private var upperPrice: Double = 200
    @State private var selectedCategories: Set<String> = []
    
    let genres = ["Hip Hop", "RnB", "House"]
    let categories = ["Concerts", "Parties", "Music Shows", "Festivals", "Tours"]

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Location")) {
                    HStack {
                        Button(action: {
                            selectedLocation = "Use GPS"
                        }) {
                            Text("Use GPS")
                                .padding()
                                .background(selectedLocation == "Use GPS" ? Color.purple : Color.clear)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            selectedLocation = "Search Location"
                        }) {
                            Text("Search Location")
                                .padding()
                                .background(selectedLocation == "Search Location" ? Color.purple : Color.clear)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }

                Section(header: Text("Date")) {
                    DatePicker("Choose Date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Section(header: Text("Genre")) {
                    ForEach(genres, id: \.self) { genre in
                        Button(action: {
                            if selectedGenre.contains(genre) {
                                selectedGenre.remove(genre)
                            } else {
                                selectedGenre.insert(genre)
                            }
                        }) {
                            Text(genre)
                                .padding()
                                .background(selectedGenre.contains(genre) ? Color.purple : Color.clear)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }

                Section(header: Text("Price Range")) {
                    VStack {
                        Slider(value: $lowerPrice, in: 50...upperPrice)
                        Slider(value: $upperPrice, in: lowerPrice...200)
                    }
                    Text("Price Range: \(Int(lowerPrice)) - \(Int(upperPrice))")
                        .foregroundColor(.white)
                }

                Section(header: Text("Categories")) {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            if selectedCategories.contains(category) {
                                selectedCategories.remove(category)
                            } else {
                                selectedCategories.insert(category)
                            }
                        }) {
                            Text(category)
                                .padding()
                                .background(selectedCategories.contains(category) ? Color.purple : Color.clear)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .background(Color.black)
            .foregroundColor(.white)
            
            HStack {
                Button("Reset Filters") {
                    // Reset all filters
                    selectedLocation = "Use GPS"
                    selectedGenre.removeAll()
                    lowerPrice = 50
                    upperPrice = 200
                    selectedCategories.removeAll()
                }
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Apply Filters") {
                    // Apply filters logic
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Refine Search")
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
