//
//  MockScanPreviewView.swift
//  scanThe
//
//  Created by Jonathan Breaker on 5/7/25.
//

import SwiftUI

struct MockScanPreviewView: View {
    @State private var isPresentingSneaker = false
    @State private var scannedSneaker: Sneaker?

    var body: some View {
        ZStack {
            BarcodeScannerView(onScan: { upc in
                // Simulate finding sneaker from UPC
                print("Mock scanned UPC: \(upc)")
                scannedSneaker = Sneaker(id: upc, title: "Air Jordan 1", brand: "Nike")
                isPresentingSneaker = true
            })

            if isPresentingSneaker, let sneaker = scannedSneaker {
                SneakerView(sneaker: sneaker, isPresented: $isPresentingSneaker)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.5))
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}


#Preview {
    MockScanPreviewView()
}
