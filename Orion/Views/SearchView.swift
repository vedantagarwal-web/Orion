//
//  SearchView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = EventViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
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
            viewModel.search(query: searchText)
        }
    }
}
