//
//  SneakerView.swift
//  scanThe
//
//  Created by Jonathan Breaker on 5/7/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SneakerView: View {
    var sneaker: Sneaker
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text(sneaker.title).font(.title)
            Text("Brand: \(sneaker.brand)")
            Button("Add to My List") {
                if let user = Auth.auth().currentUser {
                    let db = Firestore.firestore()
                    db.collection("users").document(user.uid).collection("scannedSneakers").document(sneaker.id).setData([
                        "title": sneaker.title,
                        "brand": sneaker.brand
                    ])
                    isPresented = false
                }
            }
            Button("Close") {
                isPresented = false
            }
        }.padding().background(Color.white).cornerRadius(12).shadow(radius: 10)
    }
}


//#Preview {
//    SneakerView()
//}
