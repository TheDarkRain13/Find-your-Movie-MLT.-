//
//  ContentView.swift
//  Find your Movie
//
//  Created by TheDarkRain13 on 18.10.26.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.crop.circle")
                            .font(.title2)
                    }
                    .buttonStyle(.glass)
                    
                    TextField("Search", text: $searchText)
                        .textFieldStyle(.plain)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .glassEffect(.regular, in: .capsule)
                }
                .frame(maxWidth: 700)
                .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
}

#Preview {
    ContentView()
}
