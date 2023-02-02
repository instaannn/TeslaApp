// CustomSliderModifier.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Модификатор для кастомного слайдера
struct CustomSliderModifier: ViewModifier {
    // MARK: - Public enum

    enum Name {
        case barLeft
        case barRight
        case knob
    }

    // MARK: - Public Properties

    let name: Name
    let size: CGSize
    let offset: CGFloat

    // MARK: - Public methods

    func body(content: Content) -> some View {
        content
            .frame(width: size.width)
            .position(x: size.width * 0.5, y: size.height * 0.5)
            .offset(x: offset)
    }
}
