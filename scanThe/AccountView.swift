//
//  AccountView.swift
//  scanThe
//
//  Created by Jonathan Breaker on 5/5/25.
//

import SwiftUI
import FirebaseAuth

struct AccountView: View {
    var body: some View {
        VStack {
            if let user = Auth.auth().currentUser {
                Text("Logged in as \(user.email ?? "")")
                Button("Logout") {
                    try? Auth.auth().signOut()
                }
            } else {
                Text("Not logged in")
            }
        }
    }
}


#Preview {
    AccountView()
}
