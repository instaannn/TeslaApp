// ClimateView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Экран настройки климата
struct ClimateView: View {
    // MARK: - Constants

    private enum Constants {
        static let titleText = "CLIMATE"
        static let climateSettingsText = "Climate Settings"
        static let cancelButtonTitle = "Cancel"
        static let teslaText = "Tesla Support"
        static let urlText = "https://www.tesla.com/support"
        static let degreesText = "° C"
    }

    // MARK: - Public Properties

    var body: some View {
        ZStack {
            standartGradientBackground
            VStack {
                TopControlView(titleText: Constants.titleText) {
                    presentationMode.wrappedValue.dismiss()
                } settingButtonHandler: {
                    climateViewModel.isAlertShown.toggle()
                }
                Spacer()
                    .frame(height: 90)
                progressBarBackgroundView
                Spacer()
                    .frame(height: 30)
                disclosureGroupSettingsView
                Spacer()
                    .frame(height: 50)
                Spacer()
            }
            PowerBottomSheetView()
        }
        .environmentObject(climateViewModel)
    }

    // MARK: - Private Properties

    @Environment(\.presentationMode) private var presentationMode

    @ObservedObject private var climateViewModel = ClimateViewModel()

    private var disclosureGroupSettingsView: some View {
        DisclosureGroup(Constants.climateSettingsText) {
            Spacer()
                .frame(height: 20)
            ForEach(climateViewModel.climateInfoControls, id: \.text) { climateInfoControl in
                ClimateControlView(climateInfoControl: climateInfoControl)
            }
        }
        .accentColor(.label)
        .padding(.horizontal, 30)
    }

    private var progressBarBackgroundView: some View {
        ZStack {
            firstCircleView
            secondCircleView
            thirdCircleView
            if climateViewModel.powerIsOn {
                Text("\(climateViewModel.calculateActualTemperature())\(Constants.degreesText)")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 28))
            }
            if climateViewModel.isAlertShown {
                alertView
            } else {
                EmptyView()
            }
        }
        .shadow(color: .lightShadow.opacity(0.15), radius: 20, x: -19, y: -19)
        .shadow(color: .darkShadow.opacity(0.7), radius: 20, x: 19, y: 19)
    }

    private var thirdCircleView: some View {
        Circle()
            .trim(from: 0, to: climateViewModel.circleProgress / 15)
            .stroke(
                LinearGradient(
                    colors: [.emerald, climateViewModel.selectColor],
                    startPoint: .bottom,
                    endPoint: .top
                ),
                style: StrokeStyle(
                    lineWidth: 20,
                    lineCap: CGLineCap.round
                )
            )
            .frame(height: 190)
            .rotationEffect(.degrees(-90))
            .animation(.linear, value: climateViewModel.circleProgress)
    }

    private var secondCircleView: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors: [
                        .label.opacity(0.15),
                        .label.opacity(0.15),
                        .darkShadow.opacity(0.15),
                        .darkShadow.opacity(0.15)
                    ],
                    startPoint: .bottomTrailing,
                    endPoint: .topLeading
                )
            )
            .frame(width: 120, height: 120)
    }

    private var firstCircleView: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors: [
                        .climateGradientDark,
                        .climateGradientLight
                    ],
                    startPoint: .bottomTrailing,
                    endPoint: .topLeading
                )
            )
            .frame(width: 170, height: 170)
    }

    private var standartGradientBackground: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [
                            .backgroundCustom,
                            .darkBackgroundCustom
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        }
    }

    private var alertView: some View {
        VStack(spacing: 20) {
            if let url = URL(string: Constants.urlText) {
                Link(destination: url) {
                    Text(Constants.teslaText)
                        .foregroundColor(.blueCustom)
                }
                Button(Constants.cancelButtonTitle) {
                    withAnimation(.linear) {
                        climateViewModel.isAlertShown.toggle()
                    }
                }
                .foregroundColor(.red)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(UIColor.backgroundCustom)
                .frame(width: 150, height: 150)
        )
    }
}

struct ClimateView_Previews: PreviewProvider {
    static var previews: some View {
        ClimateView()
    }
}
