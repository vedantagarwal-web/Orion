//
//  BookingDetailsView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI

struct BookingDetailsView: View {
    let event: Event
    @State private var quantity = 1
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(event.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                
                Text(event.title)
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(event.date)
                    .foregroundColor(.gray)
                
                Text(event.description)
                    .foregroundColor(.white)
                
                Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10)
                    .foregroundColor(.white)
                
                CustomButton(title: "Add to Cart", action: {
                    // Add to cart logic
                })
            }
            .padding()
        }
        .background(Color.black)
        .navigationTitle("Event Details")
    }
}
