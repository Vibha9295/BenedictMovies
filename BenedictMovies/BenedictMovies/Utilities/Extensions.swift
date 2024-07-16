//
//  Extensions.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//

import Foundation
import SwiftUI

extension View {
    func shadowStyle(color: Color = .black, radius: CGFloat = 5, x: CGFloat = 0, y: CGFloat = 2) -> some View {
        self.shadow(color: color, radius: radius, x: x, y: y)
    }
}
