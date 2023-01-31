// LinearGradient+Extension.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Кастомный градиент
extension LinearGradient {
    static let customLinearGradient = LinearGradient(
        colors: [.emerald, .blueCustom],
        startPoint: .bottom,
        endPoint: .top
    )
}
