//
//  RegisterationView.swift
//  CookingCorner
//
//  Created by srisshar on 09/05/25.
//

import SwiftUI

struct RegisterationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Image("loginPageImage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("New User?")
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding()
                        .foregroundColor(.button)
                }
                .padding(.leading, -185)
            }
            
            VStack(alignment: .leading, spacing: 40) {
                
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("EMAIL ADDRESS")
                            .font(.caption)
                            .foregroundColor(.mediumGray)
                            .fontWeight(.bold)
                        TextField(
                            "username@gmail.com",
                            text: $email,
                            prompt: Text("username")
                                .foregroundColor(.button)
                                .fontWeight(.semibold)
                        )
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.bottom, 4)
                        .overlay(
                            Rectangle().frame(height: 1).padding(.top, 35),
                            alignment: .top
                        )
                        .foregroundColor(.lightGray)
                        .padding(.bottom, 20)
                    }
                    VStack(alignment: .leading) {
                        Text("PASSWORD")
                            .font(.caption)
                            .foregroundColor(.mediumGray)
                            .fontWeight(.bold)
                        SecureField(
                            "",
                            text: $password,
                            prompt: Text("........")
                                .foregroundColor(.button)
                                .fontWeight(.semibold)
                        )
                        .padding(.bottom, 4)
                        .overlay(
                            Rectangle().frame(height: 1).padding(.top, 35),
                            alignment: .top
                        )
                        .foregroundColor(.lightGray)
                    }
                    VStack(alignment: .leading) {
                        Text("CONFIRM PASSWORD")
                            .font(.caption)
                            .foregroundColor(.mediumGray)
                            .fontWeight(.bold)
                        SecureField(
                            "",
                            text: $password,
                            prompt: Text("........")
                                .foregroundColor(.button)
                                .fontWeight(.semibold)
                        )
                        .padding(.bottom, 4)
                        .overlay(
                            Rectangle().frame(height: 1).padding(.top, 35),
                            alignment: .top
                        )
                        .foregroundColor(.lightGray)
                    }
                }
                
                PrimaryButtonView(label: "Create Account") {
                    
                }
                Spacer()
            }
            .padding(.top, 30)
            .padding([.leading, .trailing], 28)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: HStack {
            BackButtonView(buttonAction: {
                self.presentationMode.wrappedValue.dismiss()
            })
        })
    }
}

#Preview {
    RegisterationView()
}
