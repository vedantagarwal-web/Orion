//
//  EventRow.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI

struct EventRow: View {
    let event: Event
    
    // DateFormatter to format the event date
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none // Use .short if you want to include time
        return formatter
    }

    var body: some View {
        HStack {
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                // Use the DateFormatter to display the date as a String
                Text(dateFormatter.string(from: event.date))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
