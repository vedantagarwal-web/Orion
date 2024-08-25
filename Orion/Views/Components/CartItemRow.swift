//
//  CartItemRow.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI

struct CartItemRow: View {
    let item: CartItem
    @ObservedObject var viewModel: CartViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image(item.event.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(item.event.title)
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                    Text("$\(item.event.price, specifier: "%.2f") each")
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 5) {
                    Text("$\(item.event.price * Double(item.quantity), specifier: "%.2f")")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Stepper(value: Binding(
                        get: { item.quantity },
                        set: { viewModel.updateQuantity(for: item, quantity: $0) }
                    ), in: 1...10) {
                        Text("Qty: \(item.quantity)")
                            .font(.system(size: 14, design: .rounded))
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.vertical, 8)
            Divider()
        }
    }
}
