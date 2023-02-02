// WelcomeView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Экран приветствия
struct WelcomeView: View {
    // MARK: - Constants

    private enum Constants {
        static let lockCarImageName = "lockCar"
        static let lockText = "Lock"
        static let unLockText = "Unlock"
        static let lockOpenImageName = "lock.open.fill"
        static let lockImageName = "lock.fill"
        static let settingImageName = "setting"
        static let whiteCarImageName = "whiteCar"
        static let hiText = "Hi"
        static let welcomeText = "Welcome back"
        static let unlockSettingImageName = "unlockSetting"
    }

    // MARK: - Public Properties

    var body: some View {
        NavigationView {
            ZStack {
                standartGradientBackground
                gradientBackground
                VStack {
                    settingButtonView
                    Spacer()
                        .frame(height: 40)
                    welcomeTextView
                    Spacer()
                        .frame(height: 5)
                    carImageView
                    Spacer()
                        .frame(height: 50)
                    lockUnlockCarView
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }

    // MARK: - Private Properties

    @StateObject private var welcomeViewModel = WelcomeViewModel()

    private var welcomeTextView: some View {
        VStack {
            Text(Constants.hiText)
                .foregroundColor(.label)
                .font(.system(size: 20))
            Text(Constants.welcomeText)
                .foregroundColor(.white)
                .font(.system(size: 40))
                .fontWeight(.bold)
        }
        .opacity(welcomeViewModel.isCarClose ? 0 : 1)
    }

    private var carImageView: some View {
        ZStack {
            Image(Constants.lockCarImageName)
                .opacity(welcomeViewModel.isCarClose ? 1 : 0)
            Image(Constants.whiteCarImageName)
                .opacity(welcomeViewModel.isCarClose ? 0 : 1)
        }
    }

    private var settingButtonView: some View {
        HStack {
            Spacer()
            NavigationLink(destination: MainView()) {
                Image(welcomeViewModel.isCarClose ? Constants.settingImageName : Constants.unlockSettingImageName)
                    .resizable()
                    .scaledToFit()
                    .neumorphismUnSelectedCircleStyle()
            }
            .padding(.horizontal, 30)
            .padding(.top, 20)
        }
    }

    private var lockUnlockCarView: some View {
        HStack(spacing: 20) {
            Text(welcomeViewModel.isCarClose ? Constants.unLockText : Constants.lockText)
            Button {
                withAnimation {
                    welcomeViewModel.isCarClose.toggle()
                }
            } label: {
                LinearGradient.customLinearGradient
                    .mask(
                        Image(
                            systemName: welcomeViewModel.isCarClose ? Constants.lockImageName : Constants
                                .lockOpenImageName
                        )
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    )
                    .neumorphismUnSelectedCircleStyle()
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 28)
        .background(
            RoundedRectangle(cornerRadius: 50)
                .fill(
                    welcomeViewModel.isCarClose ? LinearGradient(
                        colors: [.backgroundCustom, .darkShadow.opacity(0.5)],
                        startPoint: .bottomTrailing,
                        endPoint: .topLeading
                    ) : LinearGradient(
                        colors: [.backgroundCustom, .darkShadow.opacity(0.5)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
    }

    private var gradientBackground: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    colors: [
                        .backgroundCustom,
                        .darkShadow,
                        .darkShadow,
                        .darkShadow,
                        .backgroundCustom
                    ],
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .opacity(welcomeViewModel.isCarClose ? 1 : 0)
    }

    private var standartGradientBackground: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [
                            .backgroundCustom,
                            .darkShadow
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Circle()
                    .fill(LinearGradient.customLinearGradient)
                    .frame(width: 100, height: 100)
                    .shadow(color: .blueCustom, radius: 30, x: 0, y: 0)
                    .blur(radius: 150)
            }
            .padding(.top, -100)
        }
        .opacity(welcomeViewModel.isCarClose ? 0 : 1)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .preferredColorScheme(.dark)
    }
}
