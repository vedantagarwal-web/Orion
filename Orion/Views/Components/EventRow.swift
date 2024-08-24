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
                Text(event.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
