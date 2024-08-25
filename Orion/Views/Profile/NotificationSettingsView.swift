//
//  NotificationSettingsView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/25/24.
//

import Foundation
import SwiftUI

struct NotificationSettingsView: View {
    @State private var eventReminders = true
    @State private var promotionalNotifications = false
    @State private var dailyUpdates = true
    
    var body: some View {
        Form {
            Section(header: Text("Event Notifications")) {
                Toggle("Event Reminders", isOn: $eventReminders)
                Toggle("Promotional Notifications", isOn: $promotionalNotifications)
                Toggle("Daily Updates", isOn: $dailyUpdates)
            }
            
            Section {
                Button("Update Notification Settings") {
                    // Here you would typically update these settings on your server
                    print("Updating notification settings...")
                }
            }
        }
        .navigationTitle("Notification Settings")
    }
}
