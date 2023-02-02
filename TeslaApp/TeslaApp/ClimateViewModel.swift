// ClimateViewModel.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью модель экрана климат конроля
final class ClimateViewModel: ObservableObject {
    // MARK: - Public Properties

    @Published var circleProgress = 0.0
    @Published var climateInfoControls = ClimateInfoControl.getClimateInfoControls()
    @Published var powerIsOn = false
    @Published var selectColor: Color = .blueCustom
    @Published var isAlertShown = false
    @Published var sliderValue = 0.0

    // MARK: - Public methods

    func calculateActualTemperature() -> Int {
        Int(15.0 + circleProgress)
    }
}
