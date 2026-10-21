//
//  EditProfileView.swift
//  Find your Movie (MLT.)
//
//  Created by TheDarkRain13 on 20.10.26.
//

import SwiftUI
import PhotosUI

struct AccountSettingsView: View {
    @AppStorage("userName") private var userName = "User"
    @AppStorage("userEmail") private var userEmail = "user@example.com"
    @AppStorage("profileImageFileName") private var profileImageFileName = ""
    @State private var selectedPhoto: PhotosPickerItem? = nil
    
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
                    Text("Coming soon")
                        .foregroundStyle(.secondary)
                }
            }
            Section("Profile Picture") {
                PhotosPicker(selection: $selectedPhoto, matching: .images) {
                    Text("Choose Photo")
                }
                .onChange(of: selectedPhoto) { _, newValue in
                    Task {
                        if let data = try? await newValue?.loadTransferable(type: Data.self) {
                            do {
                                try FileManager.default.createDirectory(
                                    at: URL.documentsDirectory,
                                    withIntermediateDirectories: true
                                    )
                                
                                let newFileName = "profile-\(UUID().uuidString).jpg"
                                let newURL = URL.documentsDirectory.appending(path: newFileName)
                                try data.write(to: newURL)
                                
                                if !profileImageFileName.isEmpty {
                                    let oldURL = URL.documentsDirectory.appending(path: profileImageFileName)
                                    try? FileManager.default.removeItem(at: oldURL)
                                }
                                
                                profileImageFileName = newFileName
                            } catch {
                                print("Could not save profile image: \(error)")
                            }
                        }
                    }
                }
                if !profileImageFileName.isEmpty {
                    Button("Remove Photo", role: .destructive) {
                        let url = URL.desktopDirectory.appending(path: profileImageFileName)
                        try? FileManager.default.removeItem(at: url)
                        profileImageFileName = ""
                        selectedPhoto = nil
                    }
                }
            }
        }
        .navigationTitle("Account Settings")
    }
}

#Preview {
    AccountSettingsView()
}
