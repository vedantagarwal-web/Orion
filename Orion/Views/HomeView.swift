//
//  HomeView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = EventViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Featured Events")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        ForEach(viewModel.featuredEvents) { event in
                            NavigationLink(destination: EventDetailView(event: event)) {
                                EventCard(event: event)
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
    }
}
