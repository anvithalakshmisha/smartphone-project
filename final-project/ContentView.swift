//
//  ContentView.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/6/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Welcome to Travel diary")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                Image(systemName: "airplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                
                NavigationLink(destination: EmailSignInView()) {
                    Text("Sign in with Email")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .padding(.top)
                
                SignInWithGoogleButton()
                    .padding(.top)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct EmailSignInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Sign in with Email")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            TextField("Username", text: $username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Button(action: {
                // Your login logic here
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            .padding(.top)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct SignInWithGoogleButton: View {
    var body: some View {
        Button(action: {
            // Your Google sign-in logic here
        }) {
            Text("Sign in with Google")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red) // Use Google's brand color
                .cornerRadius(8)
                .padding(.horizontal)
        }
    }
}


#Preview {
    SplashScreen()
}
