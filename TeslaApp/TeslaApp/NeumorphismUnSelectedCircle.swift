// NeumorphismUnSelectedCircle.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Тень не выбранной вью
struct NeumorphismUnSelectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 25, height: 25)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(
                        LinearGradient(
                            colors: [.backgroundCustom.opacity(0.15), .darkShadow.opacity(0.5)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            )
            .overlay(
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [.darkShadow.opacity(0.5), .backgroundCustom.opacity(0.15)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
            )
            .neumorphismUnSelectedStyle()
    }
}
