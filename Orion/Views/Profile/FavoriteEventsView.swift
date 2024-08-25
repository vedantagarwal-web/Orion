//
//  FavoriteEventsView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/25/24.
//

import Foundation
import SwiftUI

struct FavoriteEventsView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        List {
            ForEach(userViewModel.favoriteEvents) { event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    EventRow(event: event)
                }
            }
            .onDelete(perform: removeEvents)
        }
        .navigationTitle("Favorite Events")
        .listStyle(PlainListStyle())
    }
    
    private func removeEvents(at offsets: IndexSet) {
        for index in offsets {
            let event = userViewModel.favoriteEvents[index]
            userViewModel.toggleFavorite(event)
        }
    }
}
