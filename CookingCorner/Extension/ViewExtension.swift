//
//  ViewExtension.swift
//  CookingCorner
//
//  Created by srisshar on 28/06/24.
//

import Foundation
import SwiftUI

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }    
}
