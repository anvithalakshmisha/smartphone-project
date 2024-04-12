//
//  ContentView.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/6/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var backgroundImage: UIImage? = nil
    @State private var isHeadingVisible = false
    @State private var isImageVisible = false
    
    var body: some View {
        NavigationView {
            VStack() {
                Spacer()
                
                if isHeadingVisible {
                    Text("Welcome to Travel diary")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 3, x: 0, y: 3) // Adding shadow for better readability
                        .transition(.opacity) // Fade in animation for the heading
                }
                
                if isImageVisible {
                    Image(systemName: "airplane")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 3, x: 0, y: 3) // Adding shadow for better readability
                        .transition(.opacity) // Fade in animation for the image
                }
                
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
            .onAppear {
                withAnimation(.easeInOut(duration: 1.0)) {
                    isImageVisible = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        isHeadingVisible = true
                    }
                }
            }
        }
    }
}


#Preview {
    SplashScreen()
}
