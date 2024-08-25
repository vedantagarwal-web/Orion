//
//  ReviewView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/25/24.
//

import Foundation
import SwiftUI

struct ReviewView: View {
    let reviews: [Review]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Reviews")
                .font(.title2)
                .fontWeight(.bold)
            
            ForEach(reviews) { review in
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(review.userName)
                            .fontWeight(.semibold)
                        Spacer()
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= review.rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    Text(review.comment)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(review.date, style: .date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.secondaryBrand)
                .cornerRadius(10)
            }
        }
    }
}
