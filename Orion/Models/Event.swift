//
//  Event.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import Foundation

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let venue: String
    let description: String
    let price: Double
    let image: String
}
