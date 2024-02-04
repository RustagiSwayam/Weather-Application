//
//  Extensions.swift
//  WeatherApp
//
//  Created by Swayam Rustagi on 04/02/24.
//

import Foundation
import SwiftUI


//this extension is basically converting all double values of the temperatures to Strings and upto only 1 decimal points.

extension Double{
    func roundedDouble() -> String{
        return String(format: "%.0f", self)
    }
}

// Extension for adding rounded corners to specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
