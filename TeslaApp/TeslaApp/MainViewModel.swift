// MainViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель главного экрана
final class MainViewModel: ObservableObject {
    // MARK: - Public Properties

    @Published var tagSelected = 0
    @Published var isCarClose = false
}
