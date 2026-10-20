//
//  EditProfileView.swift
//  Find your Movie (MLT.)
//
//  Created by TheDarkRain13 on 20.10.26.
//

import SwiftUI

struct AccountSettingsView: View {
    @AppStorage("userName") private var userName = "User"
    
    var body: some View {
        Form {
            TextField("Name", text: $userName)
        }
        .navigationTitle("Edit Profile")
    }
}

#Preview {
    AccountSettingsView()
}
