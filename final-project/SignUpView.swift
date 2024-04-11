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
    @State private var isLoggedin = false // Add state variable to control navigation
    
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
                
                // Here you can check if the login is successful, if yes, navigate to HomeScreenView
                // For simplicity, let's just set a flag to true
                isLoggedin = true
            }) {
                Text("Sign Up")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(5)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
            }
            NavigationLink(
                destination: HomeScreenView(),
                isActive: $isLoggedin,
                label: { EmptyView() }
            )
        }
        .padding()
    }
}
