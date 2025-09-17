//
//  LaunchView.swift
//  CookingCorner
//
//  Created by srisshar on 08/05/25.
//

import SwiftUI

struct LaunchView: View {
    
    @State var isLoggedIn: Bool = false
    @State var isSignedUp: Bool = false
    
    var body: some View {
            VStack {
                Image("login 1")
                    .resizable()
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    Text("Wanna Cook")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    HStack {
                        Text("Something")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Delicious?")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.button)
                    }
                    Text("Discover New receipes, plan your meals, and explore a world of flavors.")
                        .multilineTextAlignment(.center)
                        .padding()
                    VStack {
                        PrimaryButtonView(label: "Login") {
                            isLoggedIn = true
                        }
                        SecondaryButton(label: "Sign Up") {
                            isSignedUp = true
                        }
                    }
                    .navigationDestination(isPresented: $isLoggedIn) {
                        NewLoginView()
                    }
                    .navigationDestination(isPresented: $isSignedUp) {
                        RegisterationView()
                    }
                    .padding()
                }
                .foregroundColor(.white)
                Spacer()
            }
            .background(.black)
            .navigationBarBackButtonHidden()
    }
}

#Preview {
    LaunchView(isLoggedIn: false)
}
