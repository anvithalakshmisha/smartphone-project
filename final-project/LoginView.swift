import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var resetPasswordEmail: String = ""
    @State private var isResetPasswordShowing = false
    @State private var errorMessage: String? = nil
    @State private var isLoggedin = false // Add state variable to control navigation
    
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
                
                // Here you can check if the login is successful, if yes, navigate to HomeScreenView
                // For simplicity, let's just set a flag to true
                isLoggedin = true
            }) {
                Text("Login")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(5)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
            }
            
            NavigationLink(destination: HomeScreenView(), isActive: $isLoggedin) {
                EmptyView()
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
