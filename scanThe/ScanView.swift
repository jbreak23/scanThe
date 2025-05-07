//
//  ScanView.swift
//  scanThe
//
//  Created by Jonathan Breaker on 5/5/25.
//

import SwiftUI
import AVFoundation
import FirebaseFirestore

struct ScanView: View {
    @State private var isPresentingSneaker = false
    @State private var scannedSneaker: Sneaker?

    func handleScannedUPC(_ upc: String) {
        let db = Firestore.firestore()
        db.collection("sneakers").document(upc).getDocument { snapshot, error in
            if let data = snapshot?.data() {
                scannedSneaker = Sneaker(id: upc, title: data["title"] as? String ?? "", brand: data["brand"] as? String ?? "")
                isPresentingSneaker = true
            }
        }
    }

    var body: some View {
        ZStack {
//            BarcodeScannerView(onScan: handleScannedUPC)
//            if isPresentingSneaker, let sneaker = scannedSneaker {
//                SneakerView(sneaker: sneaker, isPresented: $isPresentingSneaker)
//            }
        }
    }
}


#Preview {
    ScanView()
}
