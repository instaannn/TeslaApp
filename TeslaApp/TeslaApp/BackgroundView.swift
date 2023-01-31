// BackgroundView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Кастомный фон
struct BackgroundView {
    static func customView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(UIColor.backgroundCustom)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            content()
        }
    }
}
