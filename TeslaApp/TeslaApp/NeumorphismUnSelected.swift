// NeumorphismUnSelected.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Тень не выбранной вью
struct NeumorphismUnSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .lightShadow.opacity(0.15), radius: 5, x: -7, y: -7)
            .shadow(color: .darkShadow.opacity(0.5), radius: 5, x: 7, y: 7)
    }
}
