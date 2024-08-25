//
//  BookingDetailsView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import SwiftUI

struct BookingDetailsView: View {
    let event: Event
    
    // Create a DateFormatter to format the event date
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 10)

            Text(event.title)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            // Use the DateFormatter to display the date as a String
            Text(dateFormatter.string(from: event.date))
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(event.venue)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("$\(event.price, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.red)
            
            Text(event.description)
                .font(.body)
                .foregroundColor(.white)
                .padding(.top, 10)
            
            Spacer()
            
            Button(action: {
                // Handle booking action
            }) {
                Text("Book Now")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Booking Details", displayMode: .inline)
    }
}
