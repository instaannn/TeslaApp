// ClimateInfoControl.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Нaстройки климат контроля
struct ClimateInfoControl {
    /// Название
    let text: String
    /// Название картинки
    let imageName: String
    /// Флаг первого слайдера
    let isFirstSlider: Bool
    
    // MARK: - Public Methods

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
