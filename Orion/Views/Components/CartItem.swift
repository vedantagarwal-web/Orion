//
//  CartItem.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI
struct CartItem: Identifiable {
    let id = UUID()
    let event: Event
    var quantity: Int
}
