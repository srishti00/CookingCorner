//
//  NewLoginView.swift
//  CookingCorner
//
//  Created by srisshar on 30/07/25.
//

import SwiftUI

struct NewLoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State var isSignedUp: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Image("loginPageImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Login")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding()
                        .foregroundColor(.button)
                    TextField("Email Address", text: $email)
                        .foregroundStyle(.blue)
                }
                .padding(.leading, -185)
            }
            VStack(alignment: .leading, spacing: 15) {
                Text("EMAIL ADDRESS")
                    .font(.caption)
                    .foregroundColor(.mediumGray)
                    .fontWeight(.bold)
                TextField(
                    "username@gmail.com",
                    text: $email,
                    prompt: Text("username")
//                        .foregroundColor(.button)
//                        .fontWeight(.semibold)
                )
//                .keyboardType(.emailAddress)
//                .autocapitalization(.none)
//                .padding(.bottom, 4)
//                .overlay(
//                    Rectangle().frame(height: 1).padding(.top, 35),
//                    alignment: .top
//                )
//                .foregroundColor(.button)
//                .fontWeight(.semibold)
//                .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    NewLoginView()
}
