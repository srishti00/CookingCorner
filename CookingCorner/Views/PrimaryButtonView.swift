//
//  PrimaryButtonView.swift
//  CookingCorner
//
//  Created by srisshar on 09/05/25.
//

import SwiftUI

struct PrimaryButtonView: View {
    
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
            Text(label)
                .font(.subheadline)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(.button)
                .border(.button)
                .cornerRadius(30)
                .shadow(radius: 4)
        }
    }
}

#Preview {
    PrimaryButtonView(label: "Ok") {}
}
