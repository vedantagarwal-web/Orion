//
//  DateFormatter.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/25/24.
//

import Foundation

extension DateFormatter {
    static let eventDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
}

extension Date {
    var formattedEventDate: String {
        return DateFormatter.eventDateFormatter.string(from: self)
    }
    
    var formattedShortDate: String {
        return DateFormatter.shortDateFormatter.string(from: self)
    }
}
