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
            VStack {
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
                Group {
                    if let backgroundImage = backgroundImage {
                        Image(uiImage: backgroundImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                    } else {
                        Color.clear // Placeholder background color until image is loaded
                    }
                }
            )
            .onAppear {
                downloadImage(from: URL(string: "https://cdn.mos.cms.futurecdn.net/k6okX2VVUg4qWoyxuNLsf7-1200-80.jpg")!)
            }
            .navigationBarHidden(true)
        }
    }
    
    func downloadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.backgroundImage = UIImage(data: data)
            }
        }.resume()
    }
}


#Preview {
    SplashScreen()
}
