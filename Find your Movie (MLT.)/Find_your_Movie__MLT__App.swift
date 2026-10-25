//
//  Find_your_Movie__MLT__App.swift
//  Find your Movie (MLT.)
//
//  Created by TheDarkRain13 on 18.10.26.
//

import SwiftUI

@main
struct Find_your_Movie__MLT__App: App {
    @AppStorage("appearance") private var appearance = "system"
    private var colorScheme: ColorScheme? {
        switch appearance {
        case "light":
            return .light
        case "dark":
            return .dark
        default:
            return nil
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(colorScheme)
        }
    }
}
