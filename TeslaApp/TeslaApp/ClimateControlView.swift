// ClimateControlView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Контрол со слайдером
struct ClimateControlView: View {
    // MARK: - Constants

    private enum Constants {
        static let snowGradientImageName = "snowGradient"
        static let knobImageName = "knob"
    }

    // MARK: - Public Properties

    let climateInfoControl: ClimateInfoControl
    @EnvironmentObject var climateViewModel: ClimateViewModel

    var body: some View {
        HStack(spacing: 30) {
            textButtonView
            sliderView
        }
    }

    // MARK: - Private Properties

    @State private var sliderValue = 0.0

    private var textButtonView: some View {
        HStack(spacing: 10) {
            Text(climateInfoControl.text)
                .fontWeight(.semibold)
                .foregroundColor(.label)
                .font(.system(size: 17))
                .frame(width: 50)
            if climateInfoControl.isFirstSlider {
                makeImageView(
                    imageName: climateViewModel.powerIsOn ? Constants
                        .snowGradientImageName : climateInfoControl.imageName
                )
            } else {
                makeImageView(imageName: climateInfoControl.imageName)
            }
        }
        .accentColor(.label)
        .font(.system(size: 20))
    }

    private var sliderView: some View {
        CustomSlider(
            value: climateInfoControl.isFirstSlider ? $climateViewModel.circleProgress : $sliderValue,
            range: (0, 15)
        ) { modifiers in
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .fill(
                        LinearGradient(
                            colors: [.climateGradientDark, .climateGradientLight],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(height: 6)
                    .modifier(modifiers.barRight)
                RoundedRectangle(cornerRadius: 5)
                    .fill(
                        LinearGradient.customLinearGradient
                    )
                    .frame(height: 6)
                    .modifier(modifiers.barLeft)
                Image(Constants.knobImageName)
                    .offset(y: 7)
                    .shadow(color: .darkBackgroundCustom, radius: 5, x: 5, y: 5)
                    .modifier(modifiers.knob)
            }
        }
        .frame(height: 25)
    }

    // MARK: - Private Methods

    private func makeImageView(imageName: String) -> some View {
        Image(imageName)
            .frame(width: 25, height: 25)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(
                        LinearGradient(
                            colors: [.climateGradientDark.opacity(0.15), .climateGradientLight],
                            startPoint: .bottomTrailing,
                            endPoint: .topLeading
                        )
                    )
            )
            .overlay(
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [
                                .climateGradientDark.opacity(0.5),
                                .climateGradientLight.opacity(0.15)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
            )
            .shadow(color: .darkShadow, radius: 5, x: 4, y: 4)
    }
}

struct ClimateControlView_Previews: PreviewProvider {
    static var previews: some View {
        ClimateControlView(climateInfoControl: ClimateInfoControl(text: "", imageName: "", isFirstSlider: false))
    }
}
