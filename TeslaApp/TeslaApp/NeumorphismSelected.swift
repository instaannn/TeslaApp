// NeumorphismSelected.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Тень выбранной вью
struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: .darkShadow.opacity(0.15), radius: 5, x: -5, y: -5)
    }
}
