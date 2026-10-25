//
//  AppearanceSettingsView.swift
//  Find your Movie (MLT.)
//
//  Created by Lucas Obuch on 25.10.26.
//

import SwiftUI

struct AppearanceSettingsView: View {
    @AppStorage("appearance") private var appearance = "system"
    
    var body: some View {
        Form {
            Section("Theme") {
                Picker("Theme", selection: $appearance) {
                    Text("System")
                        .tag("system")
                    Text("Light")
                        .tag("light")
                    Text("Dark")
                        .tag("dark")
                }
                .pickerStyle(.inline)
                .labelsHidden()
            }
        }
        .navigationTitle("Appearance")
    }
}

#Preview {
    AppearanceSettingsView()
}
