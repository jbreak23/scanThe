//
//  ContentView.swift
//  scanThe
//
//  Created by Jonathan Breaker on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("HOME")
                }

            DiscoverView()
                .tabItem {
                    Image(systemName: "location.north.line")
                    Text("DISCOVER")
                }

            ScanView()
                .tabItem {
                    Image(systemName: "barcode.viewfinder")
                    Text("SCAN")
                }

            ListView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    Text("LISTS")
                }

            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("ACCOUNT")
                }
        }
    }
}

#Preview {
    ContentView()
}
