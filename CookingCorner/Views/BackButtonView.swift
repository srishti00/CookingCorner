//
//  BackButtonView.swift
//  CookingCorner
//
//  Created by srisshar on 08/05/25.
//

import SwiftUI

struct BackButtonView: View {
    
    // MARK: Private Parameters
    private let buttonAction: () -> ()
    
    // MARK: Environment Variables
    @Environment(\.sizeCategory) private var sizeCategory: ContentSizeCategory
    
    // MARK: SwiftUI
    var body: some View {
        SwiftUI.Button {
            buttonAction()
        } label: {
            HStack {
                Image(.backArrowWhite)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 20)
                    .foregroundColor(.button)
                
                Text("back")
                    .font(.body)
                    .foregroundColor(.button)
            }
        }
    }
    
    // MARK: Init
    init(buttonAction: @escaping () -> ()) {
        self.buttonAction = buttonAction
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView(buttonAction: testButtonPressed)
            .previewLayout(.sizeThatFits)
    }
    
    static private func testButtonPressed() { }
}
