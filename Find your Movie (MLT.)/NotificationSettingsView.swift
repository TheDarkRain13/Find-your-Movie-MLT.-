//
//  NotificationSettingsView.swift
//  Find your Movie (MLT.)
//
//  Created by TheDarkRain13 on 20.10.26.
//

import SwiftUI

struct NotificationSettingsView: View {
    @AppStorage("notificationsEnabled") private var notificationsEnabled = true
    
    var body: some View {
        Form {
            Toggle("Enable notifications", isOn: $notificationsEnabled)
        }
        .navigationTitle("Notification")
    }
}

#Preview {
    NotificationSettingsView()
}
