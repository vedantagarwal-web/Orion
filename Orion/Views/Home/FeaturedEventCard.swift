//
//  FeaturedEventCard.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/25/24.
//

import Foundation
import SwiftUI

struct FeaturedEventCard: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200)
                .clipped()
                .cornerRadius(15)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(event.title)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text(event.date, style: .date)
                    .font(.system(size: 14, design: .rounded))
                    .foregroundColor(.gray)
                
                Text(event.venue)
                    .font(.system(size: 14, design: .rounded))
                    .foregroundColor(.gray)
                
                Text("$\(event.price, specifier: "%.2f")")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.highlightBrand)
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
        }
        .background(Color.secondaryBrand)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}
