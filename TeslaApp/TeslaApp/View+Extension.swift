//
//  View+Extension.swift
//  TeslaApp
//
//  Created by Анна Сычева on 31.01.2023.
//

import SwiftUI

/// Расширение для вью
extension View {
    func neumorphismUnSelectedStyle() -> some View {
        modifier(NeumorphismUnSelected())
    }

    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }

    func neumorphismUnSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnSelectedCircle())
    }
}
