// ClimateInfoControl.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Нaстройки климат контроля
struct ClimateInfoControl {
    let text: String
    let imageName: String
    let isFirstSlider: Bool

    static func getClimateInfoControls() -> [ClimateInfoControl] {
        let climateInfoControls: [ClimateInfoControl] = [
            .init(text: "Ac", imageName: "snow", isFirstSlider: true),
            .init(text: "Fan", imageName: "fan", isFirstSlider: false),
            .init(text: "Heat", imageName: "heat", isFirstSlider: false),
            .init(text: "Auto", imageName: "auto", isFirstSlider: false)
        ]
        return climateInfoControls
    }
}
