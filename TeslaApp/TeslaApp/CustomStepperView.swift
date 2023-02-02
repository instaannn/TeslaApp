// CustomStepperView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Кастомный степпер
struct CustomStepperView: View {
    // MARK: - Constants

    private enum Constants {
        static let chevronLeftImageName = "chevron.left"
        static let degreesText = "° C"
        static let chevronRightImageName = "chevron.right"
    }

    // MARK: - Public properties

    var body: some View {
        HStack {
            Button {
                climateViewModel.circleProgress -= 1
            } label: {
                Image(systemName: Constants.chevronLeftImageName)
            }
            Text("\(climateViewModel.calculateActualTemperature())\(Constants.degreesText)")
                .font(.system(size: 34))
                .padding(.horizontal)
            Button {
                climateViewModel.circleProgress += 1
            } label: {
                Image(systemName: Constants.chevronRightImageName)
            }
        }
        .frame(width: 250, alignment: .center)
        .foregroundColor(.white)
    }

    // MARK: - Private Properties

    @EnvironmentObject private var climateViewModel: ClimateViewModel
}
