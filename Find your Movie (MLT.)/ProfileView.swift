//
//  ProfileView.swift
//  Find your Movie (MLT.)
//
//  Created by TheDarkRain13 on 18.10.26.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("userName") private var userName = "User"
    @AppStorage("userEmail") private var userEmail = "user@example.com"
    @State private var showLogoutConfirmation: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundStyle(.white)
                    Text(userName)
                        .font(.title)
                        .bold()
                    Text(userEmail)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.8))
                }
                .frame(maxWidth: .infinity)
                VStack(spacing: 0) {
                    NavigationLink(destination: AccountSettingsView()) {
                        HStack {
                            Image(systemName: "gearshape")
                                .frame(width: 28)
                            Text("Account Settings")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    Divider()
                    NavigationLink(destination: NotificationSettingsView()) {
                        HStack {
                            Image(systemName: "bell")
                                .frame(width: 28)
                            Text("Notifications")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    Divider()
                    NavigationLink(destination: Text("Privacy & Security")) {
                        HStack {
                            Image(systemName: "lock")
                                .frame(width: 28)
                            Text("Privacy & Security")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    Divider()
                    NavigationLink(destination: Text("Appearance")) {
                        HStack {
                            Image(systemName: "paintpalette")
                                .frame(width: 28)
                            Text("Appearance")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    Divider()
                    NavigationLink(destination: Text("Help")) {
                        HStack {
                            Image(systemName: "questionmark.circle")
                                .frame(width: 28)
                            Text("Help")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.secondary)
                        }
                        .padding()
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
                .glassEffect(.regular, in: .rect(cornerRadius: 24))
                Button("Log Out") {
                    showLogoutConfirmation = true
                }
                .buttonStyle(.glass)
                .frame(maxWidth: .infinity)
                .tint(.red)
                .confirmationDialog("Log Out?", isPresented: $showLogoutConfirmation, titleVisibility: .visible) {
                    Button("Log Out", role: .destructive) {}
                    Button("Cancel", role: .cancel) {}
                } message: {
                    Text("You will need to sign in again.")
                }
            }
            .padding()
            .frame(maxWidth: 600)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Profile")
        .background(
            LinearGradient(
                colors: [.blue, .purple, .pink],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        )
    }
}

#Preview {
    ProfileView()
}
