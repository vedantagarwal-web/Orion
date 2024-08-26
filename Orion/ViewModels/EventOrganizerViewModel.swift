//
//  EventOrganizerViewModel.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/25/24.
//

import Foundation
import Combine

class EventOrganizerViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var totalSales: Double = 0
    @Published var eventSales: [(event: Event, sales: Double)] = []
    @Published var recentTransactions: [Transaction] = []
    @Published var totalAttendance: Int = 0
    @Published var eventAttendance: [(event: Event, attendance: Int)] = []
    @Published var attendanceDemographics: [(String, Double)] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchEvents()
        fetchSalesData()
        fetchAttendanceData()
    }
    
    func fetchEvents() {
        // In a real app, this would be an API call
        self.events = [
            Event(title: "KL Music Festival",
                  date: Date().addingTimeInterval(86400 * 30),
                  venue: "KLCC Park",
                  location: "Kuala Lumpur",
                  description: "Annual music festival featuring top Malaysian artists",
                  price: 299.99,
                  image: "event_music",
                  category: "Music"),
            Event(title: "Malaysia Tech Week",
                  date: Date().addingTimeInterval(86400 * 60),
                  venue: "Kuala Lumpur Convention Centre",
                  location: "Kuala Lumpur",
                  description: "Malaysia's premier technology conference",
                  price: 599.99,
                  image: "event_tech",
                  category: "Technology")
        ]
    }
    
    func fetchSalesData() {
        // Simulated data
        self.totalSales = 15000
        self.eventSales = events.map { ($0, Double.random(in: 1000...5000)) }
        self.recentTransactions = [
            Transaction(id: UUID(), eventTitle: "Summer Festival", amount: 59.99, date: Date()),
            Transaction(id: UUID(), eventTitle: "Tech Conference", amount: 199.99, date: Date().addingTimeInterval(-86400))
        ]
    }
    
    func fetchAttendanceData() {
        // Simulated data
        self.totalAttendance = 500
        self.eventAttendance = events.map { ($0, Int.random(in: 100...300)) }
        self.attendanceDemographics = [
            ("18-25", 30),
            ("26-35", 40),
            ("36-45", 20),
            ("46+", 10)
        ]
    }
}

struct Transaction: Identifiable {
    let id: UUID
    let eventTitle: String
    let amount: Double
    let date: Date
}
