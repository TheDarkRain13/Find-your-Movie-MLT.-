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
    @State private var searchWidth: CGFloat = 300
    @FocusState private var isSearchFocused: Bool
    
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
                geometry.contentOffset.y + geometry.contentInsets.top>30
            } action: {
                _, newValue in
                withAnimation {
                    isSearchCollapsed = newValue
                }
                if newValue {
                    isSearchFocused = false
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
                    ZStack {
                        ZStack {
                            TextField("Search", text: $searchText)
                                .textFieldStyle(.plain)
                                .focused($isSearchFocused)
                                .font(.title3)
                                .padding(.horizontal)
                                .opacity(isSearchCollapsed ? 0 : 1)
                                .allowsHitTesting(!isSearchCollapsed)
                            
                            Button {
                                withAnimation {
                                isSearchCollapsed = false
                            }
                                isSearchFocused = true
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .frame(width: 50, height: 50)
                                    .contentShape(Circle())
                            }
                            .buttonStyle(.plain)
                            .font(.title2)
                            .opacity(isSearchCollapsed ? 1 : 0)
                            .allowsHitTesting(isSearchCollapsed)
                        }
                        .frame(width: isSearchCollapsed ? 50 : searchWidth, height: 50)
                        .clipped()
                        .glassEffect(.regular, in: .capsule)
                        .animation(.smooth, value: isSearchCollapsed)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .onGeometryChange(for: CGFloat.self) {
                        geometry in
                        geometry.size.width
                    } action: {
                        newWidth in
                        searchWidth = newWidth
                    }
                }
                .frame(maxWidth: 700)
                .padding()
            }
            .scrollEdgeEffectStyle(.soft, for: .top)
        }
    }
}

#Preview {
    ContentView()
}
