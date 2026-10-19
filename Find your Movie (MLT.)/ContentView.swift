//
//  ContentView.swift
//  Find your Movie
//
//  Created by TheDarkRain13 on 18.10.26.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var isSearchCollapsed: Bool = false
    @Namespace private var glassNamespace

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(0..<30, id: \.self) {_ in 
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white.opacity(0.3))
                            .frame(height: 120)
                    }
                }
                .padding(.horizontal)
            }
            .onScrollGeometryChange(for: Bool.self) {
                geometry in
                geometry.contentOffset.y+geometry.contentInsets.top>30
            } action: {
                _, newValue in
                withAnimation {
                    isSearchCollapsed = newValue
                }
            }
            .background(
                LinearGradient(
                    colors: [.blue, .purple, .pink],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .safeAreaInset(edge: .top) {
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
            }
        }
    }
}

#Preview {
    ContentView()
}
