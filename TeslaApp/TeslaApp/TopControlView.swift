// TopControlView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Верхний контрол с кнопками и названием
struct TopControlView: View {
    // MARK: - Constants

    private enum Constants {
        static let unlockSettingImageName = "unlockSetting"
        static let chevronLeftImageName = "chevronLeft"
    }

    // MARK: - Public Properties

    let titleText: String
    let backButtonHandler: () -> ()
    let settingButtonHandler: () -> ()

    var body: some View {
        HStack(alignment: .center, spacing: 60) {
            backButtonView
            titleTextView
            settingButtonView
        }
        .padding(.horizontal, 30)
        .padding(.top, 20)
    }

    // MARK: - Private Properties

    private var titleTextView: some View {
        Text(titleText)
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .font(.system(size: 20))
    }

    private var settingButtonView: some View {
        Button {
            settingButtonHandler()
        } label: {
            Image(Constants.unlockSettingImageName)
                .resizable()
                .scaledToFit()
                .neumorphismUnSelectedCircleStyle()
        }
    }

    private var backButtonView: some View {
        Button {
            backButtonHandler()
        } label: {
            Image(Constants.chevronLeftImageName)
                .scaledToFit()
                .neumorphismUnSelectedCircleStyle()
        }
    }
}

struct TopControlView_Previews: PreviewProvider {
    static var previews: some View {
        TopControlView(titleText: "") {
            print("1")
        } settingButtonHandler: {
            print("2")
        }
    }
}
