//
//  OnboardingModel.swift
//  CookingCorner
//
//  Created by srisshar on 28/06/24.
//

import Foundation
import SwiftUI

struct Intro: Identifiable {
    var id  = UUID().uuidString
    var title: String
    var subtitle: String
    var description: String
    var pic: String
    var color: LinearGradient
    var offset: CGSize = .zero
}
