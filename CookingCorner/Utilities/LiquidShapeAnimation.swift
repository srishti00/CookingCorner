//
//  LiquidShapeAnimation.swift
//  CookingCorner
//
//  Created by srisshar on 28/06/24.
//

import Foundation
import SwiftUI

struct LiquidShape: Shape {
    var offset: CGSize
    var curvePoint: CGFloat
    
    var animatableData: AnimatablePair<CGSize.AnimatableData, CGFloat> {
        get {
            return AnimatablePair(offset.animatableData, curvePoint)
        }
        set {
            offset.animatableData = newValue.first
            curvePoint = newValue.second
        }
    }
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width  = rect.width + (-offset.width > 0 ? offset.width : 0)
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let from = 80 + (offset.width)
            path.move(to: CGPoint(x: rect.width, y: from > 0 ? 80 : from))
            
            //ADding Height
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            
            //Mid Between 80-180
            let mid: CGFloat = 80 + ((to-80)/2)
            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width - curvePoint, y: mid), control2: CGPoint(x: width - curvePoint, y: mid))
        }
    }
}
