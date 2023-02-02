// CustomBottomSheetViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель боттомшита
final class CustomBottomSheetViewModel: ObservableObject {
    // MARK: - Public Properties

    @Published var currentMenuOffsetY: CGFloat = 0.0
    @Published var lastMenuOffsetY: CGFloat = 0.0

    // MARK: - Public Methods

    func getOffsetY() {
        let maxHeight = UIScreen.main.bounds.height / 10

        withAnimation {
            if -currentMenuOffsetY > maxHeight / 2 {
                currentMenuOffsetY = -maxHeight
            } else {
                currentMenuOffsetY = 0
            }
            lastMenuOffsetY = currentMenuOffsetY
        }
    }
}
