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
                
                NavigationLink(destination: SignUpView()) {
                    Text("Sign up with Email")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .padding(.top)
                
                HStack {
                    Text("Have an account already?")
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .padding()
                            .foregroundColor(.blue)
                    }
                }
                
                //                SignInWithGoogleButton()
                //                    .padding(.top)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    SplashScreen()
}
