//
//  EventDetailView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI
struct EventDetailView: View {
    let event: Event
    @State private var quantity = 1
    @EnvironmentObject var cartViewModel: CartViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(event.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(event.title)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text(event.date)
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
                    
                    HStack {
                        Text("Quantity:")
                            .foregroundColor(.white)
                        Stepper(value: $quantity, in: 1...10) {
                            Text("\(quantity)")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 10)
                    
                    Button(action: {
                        cartViewModel.addToCart(event, quantity: quantity)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Add to Cart")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Event Details", displayMode: .inline)
    }
}
