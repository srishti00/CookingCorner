//
//  SecondaryButton.swift
//  CookingCorner
//
//  Created by srisshar on 09/05/25.
//

import SwiftUI

struct SecondaryButton: View {
    
    var label: String
    var action: () -> Void
    
    init(label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text("Sign Up")
                .font(.subheadline)
                .foregroundColor(.button)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.white)
                )
                .shadow(radius: 4)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.button, lineWidth: 1.5)
                }
        }
    }
}

#Preview {
    SecondaryButton(label: "Close") {}
}
