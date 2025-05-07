//
//  DiscoverView.swift
//  scanThe
//
//  Created by Jonathan Breaker on 5/5/25.
//

import SwiftUI
import FirebaseFirestore

struct DiscoverView: View {
    @State private var searchText = ""
    @State private var sneakers: [Sneaker] = []

    var filteredSneakers: [Sneaker] {
        searchText.isEmpty ? sneakers : sneakers.filter { $0.title.lowercased().contains(searchText.lowercased()) }
    }

    var body: some View {
        VStack {
            TextField("Search Sneakers", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            List(filteredSneakers) { sneaker in
                Text(sneaker.title)
            }
        }
        .onAppear {
            Firestore.firestore().collection("sneakers").getDocuments { snapshot, _ in
                self.sneakers = snapshot?.documents.map {
                    Sneaker(id: $0.documentID, title: $0["title"] as? String ?? "", brand: $0["brand"] as? String ?? "")
                } ?? []
            }
        }
    }
}


#Preview {
    DiscoverView()
}
