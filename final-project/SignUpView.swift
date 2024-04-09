//
//  SignUpView.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/9/24.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String? = nil
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .padding()
            
            TextField("Username", text: $username)
                .padding()
            
            TextField("Email", text: $email)
                .padding()
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .padding()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
            
            Button(action: {
                // Implement your sign-up logic here
                // For simplicity, let's just print the entered data
                print("Username: \(username)")
                print("Email: \(email)")
                print("Password: \(password)")
                print("Confirm Password: \(confirmPassword)")
                
                // Here you can perform validation and actual sign-up process
                // For simplicity, let's just show a success message
                errorMessage = "Sign up successful"
            }) {
                Text("Sign Up")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(5)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
            }
            .alert(isPresented: Binding<Bool>.constant(errorMessage != nil)) {
                Alert(title: Text("Success"), message: Text(errorMessage ?? ""), dismissButton: .default(Text("OK")))
            }
        }
        .padding()
    }
}
