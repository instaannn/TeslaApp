// MainView.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Главный экран с табом
struct MainView: View {
    // MARK: - Constants

    private enum Constants {
        static let carImageName = "car"
        static let testaText = "Tesla"
        static let kmText = "187 km"
        static let lockText = "Lock"
        static let unLockText = "Unlock"
        static let lockOpenImageName = "lock.open.fill"
        static let lockImageName = "lock.fill"
    }

    // MARK: - Public Properties

    var body: some View {
        BackgroundView.customView {
            VStack {
                headerView
                carView
                controlPanelView
                Spacer()
                    .frame(height: 40)
                if mainViewModel.tagSelected == 1 {
                    closeCarControllView
                }
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }

    // MARK: - Private Properties

    @StateObject private var mainViewModel = MainViewModel()

    private var carView: some View {
        Image(Constants.carImageName)
            .resizable()
            .scaledToFit()
            .frame(height: 254)
            .padding(.horizontal)
            .padding(.bottom, 40)
    }

    private var controlPanelView: some View {
        ZStack {
            NavigationLink(
                destination: ClimateView()
                    .navigationBarHidden(true),
                isActive: $mainViewModel.isClimateViewShown
            ) {}
                .opacity(0)
            HStack(spacing: 30) {
                ForEach(1 ..< 5) { index in
                    Button {
                        withAnimation {
                            mainViewModel.tagSelected = index
                            if index == 2 {
                                mainViewModel.isClimateViewShown.toggle()
                            }
                        }
                    } label: {
                        Image("\(index)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .neumorphismUnSelectedCircleStyle()
                            .overlay(
                                Circle()
                                    .stroke(LinearGradient.customLinearGradient, lineWidth: 2)
                                    .opacity(mainViewModel.tagSelected == index ? 1 : 0)
                            )
                    }
                }
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 30)
            .background(RoundedRectangle(cornerRadius: 80).fill(UIColor.backgroundCustom))
            .neumorphismUnSelectedStyle()
        }
    }

    private var headerView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Constants.testaText)
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(Constants.kmText)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.label)
            }
            Spacer()
        }
        .padding(.all, 25)
    }

    private var closeCarControllView: some View {
        Button {
            withAnimation {
                mainViewModel.isCarClose.toggle()
            }
        } label: {
            HStack {
                Label {
                    Text(mainViewModel.isCarClose ? Constants.lockText : Constants.unLockText)
                        .foregroundColor(.white)
                } icon: {
                    Image(systemName: mainViewModel.isCarClose ? Constants.lockOpenImageName : Constants.lockImageName)
                        .renderingMode(.template)
                        .neumorphismUnSelectedCircleStyle()
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 50).fill(UIColor.backgroundCustom))
            .neumorphismSelectedStyle()
        }
        .frame(width: 300)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
