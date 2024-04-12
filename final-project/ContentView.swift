//
//  ContentView.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/6/24.
//

import SwiftUI

import SwiftUI

struct SplashScreen: View {
    @State private var backgroundImage: UIImage? = nil
    
    var body: some View {
        NavigationView {
            VStack() {
                Spacer()
                
                Text("Welcome to Travel diary")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x: 0, y: 3) // Adding shadow for better readability
                
                Image(systemName: "airplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 3, x: 0, y: 3) // Adding shadow for better readability
                
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
                        .foregroundColor(.white)
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .padding()
                            .foregroundColor(.blue)
                    }
                }
                Spacer()
            }
            .background(
                Image("splashscreen")
                    .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            )
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    SplashScreen()
}
