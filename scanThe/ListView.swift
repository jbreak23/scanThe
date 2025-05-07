//
//  ListView.swift
//  scanThe
//
//  Created by Jonathan Breaker on 5/5/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ListView: View {
    @State private var sneakers: [Sneaker] = []

    var body: some View {
        List(sneakers) { sneaker in
            Text(sneaker.title)
        }
        .onAppear {
            if let user = Auth.auth().currentUser {
                let db = Firestore.firestore()
                db.collection("users").document(user.uid).collection("scannedSneakers").getDocuments { snapshot, _ in
                    self.sneakers = snapshot?.documents.map {
                        Sneaker(id: $0.documentID, title: $0["title"] as? String ?? "", brand: $0["brand"] as? String ?? "")
                    } ?? []
                }
            }
        }
    }
}


#Preview {
    ListView()
}
