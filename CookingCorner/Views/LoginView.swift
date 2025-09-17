//
//  LoginView.swift
//  CookingCorner
//
//  Created by srisshar on 30/04/25.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email = ""
    @State private var password = ""
    @State var isSignedUp: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
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
                }
                .padding(.leading, -185)
            }
            
            VStack(alignment: .leading, spacing: 20) {
                
                VStack(alignment: .leading, spacing: 15) {
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
                    .foregroundColor(.button)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
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
                    .foregroundColor(.button)
                    .fontWeight(.semibold)
                }
                
                Button {
                    
                } label: {
                    Text("Forget password?")
                        .font(.subheadline)
                        .foregroundColor(.button)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
                PrimaryButtonView(label: "Login") {
                    
                }
                
                HStack {
                    Text("Don't have account?")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                    Button {
                        
                    } label: {
                        Text("Create new account.")
                            .font(.subheadline)
                            .foregroundColor(.button)
                            .fontWeight(.bold)
                    }
                }
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .center)
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
    LoginView()
}
