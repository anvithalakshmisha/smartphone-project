//
//  ResetPasswordView.swift
//  final-project
//
//  Created by Anvitha Lakshmisha on 4/9/24.
//

import Foundation
import SwiftUI

struct ResetPasswordView: View {
    @Binding var isResetPasswordShowing: Bool
    @Binding var resetPasswordEmail: String
    
    var body: some View {
        VStack {
            Text("Reset Password")
                .font(.title)
                .padding()
            
            TextField("Email", text: $resetPasswordEmail)
                .padding()
            
            Button(action: {
                // Implement your password reset logic here
                // For simplicity, let's just print the reset password email
                print("Reset Password Email: \(resetPasswordEmail)")
                
                // Close the reset password view
                isResetPasswordShowing.toggle()
            }) {
                Text("Reset Password")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            
            Spacer()
        }
        .padding()
    }
}
