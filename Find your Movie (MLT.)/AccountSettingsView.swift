//
//  EditProfileView.swift
//  Find your Movie (MLT.)
//
//  Created by TheDarkRain13 on 20.10.26.
//

import SwiftUI

struct AccountSettingsView: View {
    @AppStorage("userName") private var userName = "User"
    @AppStorage("userEmail") private var userEmail = "user@example.com"
    
    var body: some View {
        Form {
            Section("Personal Information") {
                TextField("Name", text: $userName)
                TextField("Email", text: $userEmail)
                    .textContentType(.emailAddress)
                    .autocorrectionDisabled()
            }
            Section("Security") {
                HStack {
                    Text("Password")
                    Spacer()
                    Text("Comming soon")
                        .foregroundStyle(.secondary)
                }
            }
            Section("Profile Picture") {
                HStack {
                    Text("Photo")
                    Spacer()
                    Text("Comming soon")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("Account Settings")
    }
}

#Preview {
    AccountSettingsView()
}
