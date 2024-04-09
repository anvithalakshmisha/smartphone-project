//
//  LoginView.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/9/24.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var resetPasswordEmail: String = ""
    @State private var isResetPasswordShowing = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()
            
            TextField("Username", text: $username)
                .padding()
            
            SecureField("Password", text: $password)
                .padding()
            
            Button(action: {
                // Implement your login logic here
                // For simplicity, let's just print the username and password
                print("Username: \(username)")
                print("Password: \(password)")
                
                // Here you can check if the login is successful, if not, show an error message
                // For simplicity, let's just show a generic error message
                errorMessage = "Invalid username or password"
            }) {
                Text("Login")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(5)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
            }
            .alert(isPresented: Binding<Bool>.constant(errorMessage != nil)) {
                Alert(title: Text("Error"), message: Text(errorMessage ?? ""), dismissButton: .default(Text("OK")))
            }
            
            Button(action: {
                isResetPasswordShowing.toggle()
            }) {
                Text("Forgot Password?")
                    .padding()
                    .foregroundColor(.blue)
            }
        }
        .sheet(isPresented: $isResetPasswordShowing) {
            ResetPasswordView(isResetPasswordShowing: $isResetPasswordShowing, resetPasswordEmail: $resetPasswordEmail)
        }
        .padding()
    }
}
