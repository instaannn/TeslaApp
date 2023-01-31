//
//  NeumorphismUnSelectedCircle.swift
//  TeslaApp
//
//  Created by Анна Сычева on 31.01.2023.
//

import SwiftUI

/// Тень не выбранной вью
struct NeumorphismUnSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(UIColor.backgroundCustom))
            .neumorphismUnSelectedStyle()
    }
}
