//
//  EventCard.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI

struct EventCard: View {
    let event: Event
    
    // DateFormatter to format the event date
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none // Use .short if you want to include time
        return formatter
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(event.title)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                // Use the DateFormatter to display the date as a String
                Text(dateFormatter.string(from: event.date))
                    .font(.system(size: 14, design: .rounded))
                    .foregroundColor(.gray)
                
                Text(event.venue)
                    .font(.system(size: 14, design: .rounded))
                    .foregroundColor(.gray)
                
                Text("$\(event.price, specifier: "%.2f")")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.red)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
        }
        .background(Color(UIColor.systemGray6))
        .cornerRadius(15)
        .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}
