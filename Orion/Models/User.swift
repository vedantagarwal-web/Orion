//
//  User.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

// Models/User.swift
import Foundation

struct User: Identifiable {
    let id = UUID()
    var name: String
    var email: String
    var profileImageUrl: String?
}
