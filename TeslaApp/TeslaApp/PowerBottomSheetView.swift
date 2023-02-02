// PowerBottomSheetView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Вью включения климат контроля
struct PowerBottomSheetView: View {
    // MARK: - Constants

    private enum Constants {
        static let acOnText = "A/C is ON"
        static let acOffText = "A/C is OFF"
        static let subtitleText = "Tap to turn off or swipe up for a fast setup"
        static let powerImageName = "power"
        static let carDoorImageName = "carDoor"
    }

    // MARK: - Public Properties

    var body: some View {
        CustomBottomSheet {
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 2)
                    .padding(.top, 15)
                textWithPowerButtonView
                stepperColorPickerBottomView
                Spacer()
            }
        }
    }

    // MARK: - Private Properties

    @EnvironmentObject private var climateViewModel: ClimateViewModel

    private var textWithPowerButtonView: some View {
        HStack(spacing: 25) {
            VStack(alignment: .leading, spacing: 5) {
                Text(climateViewModel.powerIsOn ? Constants.acOnText : Constants.acOffText)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(Constants.subtitleText)
                    .foregroundColor(.label)
                    .font(.callout)
            }
            powerButtonView
        }
        .padding(.horizontal, 20)
    }

    private var powerButtonView: some View {
        Button {
            climateViewModel.powerIsOn.toggle()
            climateViewModel.circleProgress = 0.0
        } label: {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                .blueCustom,
                                .darkBlueCustom
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 60, height: 60)
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                .blueCustom,
                                .darkBlueCustom
                            ],
                            startPoint: .bottomTrailing,
                            endPoint: .topLeading
                        )
                    )
                    .frame(width: 50, height: 50)
                Image(Constants.powerImageName)
            }
            .neumorphismUnSelectedStyle()
        }
    }

    private var stepperColorPickerBottomView: some View {
        HStack(spacing: 20) {
            ColorPicker("", selection: $climateViewModel.selectColor)
            CustomStepperView()
            Image(Constants.carDoorImageName)
        }
        .padding()
        .padding(.trailing, 10)
    }
}

struct PowerBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        PowerBottomSheetView()
    }
}
