//
//  CartView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI

struct CartView: View {
    @StateObject private var viewModel = CartViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                if viewModel.cartItems.isEmpty {
                    VStack {
                        Image(systemName: "cart")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("Your cart is empty")
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                    }
                } else {
                    VStack {
                        List {
                            ForEach(viewModel.cartItems) { item in
                                CartItemRow(item: item, viewModel: viewModel)
                            }
                            .onDelete(perform: viewModel.removeFromCart)
                        }
                        .listStyle(PlainListStyle())
                        
                        VStack {
                            HStack {
                                Text("Total:")
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                                    .foregroundColor(.white)
                                Spacer()
                                Text("$\(viewModel.total, specifier: "%.2f")")
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            .padding()
                            
                            Button(action: viewModel.checkout) {
                                Text("Checkout")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                            }
                            .padding(.horizontal)
                        }
                        .background(Color(UIColor.systemGray6))
                    }
                }
            }
            .navigationTitle("Cart")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
