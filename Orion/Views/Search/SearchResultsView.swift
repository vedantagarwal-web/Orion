//
//  SearchResultsView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI

struct SearchResultsView: View {
    let events: [Event]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(events) { event in
                    NavigationLink(destination: EventDetailView(event: event)) {
                        EventRow(event: event)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
        }
    }
}
