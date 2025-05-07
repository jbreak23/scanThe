//
//  LoginView.swift
//  scanThe
//
//  Created by Jonathan Breaker on 5/6/25.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Login") {
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if let error = error {
                        errorMessage = error.localizedDescription
                    }
                }
            }
            if let errorMessage = errorMessage {
                Text(errorMessage).foregroundColor(.red)
            }
        }.padding()
    }
}


#Preview {
    LoginView()
}
