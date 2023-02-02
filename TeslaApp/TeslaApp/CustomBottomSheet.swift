// CustomBottomSheet.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Универсальный кастомный боттомщит
struct CustomBottomSheet<Content: View>: View {
    // MARK: - Public Properties

    let content: () -> Content

    var body: some View {
        ZStack {
            content()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(
                            LinearGradient(
                                colors: [.climateGradientDark.opacity(0.5), .climateGradientLight],
                                startPoint: .bottomTrailing,
                                endPoint: .topLeading
                            )
                        )
                )
                .ignoresSafeArea(.all, edges: .bottom)
                .offset(y: UIScreen.main.bounds.height / 2 + 100)
                .offset(y: bottomSheetViewModel.currentMenuOffsetY)
                .gesture(dragGesture)
        }
        .ignoresSafeArea(edges: .top)
    }

    // MARK: - Private Properties

    @GestureState private var gestureOffset = CGSize.zero
    @StateObject private var bottomSheetViewModel = CustomBottomSheetViewModel()

    private var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, _ in
                state = value.translation
                onChangeMenuOffset()
            }
            .onEnded { _ in
                bottomSheetViewModel.getOffsetY()
            }
    }

    // MARK: - Private Methods

    private func onChangeMenuOffset() {
        DispatchQueue.main.async {
            bottomSheetViewModel.currentMenuOffsetY = gestureOffset.height + bottomSheetViewModel.lastMenuOffsetY
        }
    }
}

struct CustomBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        CustomBottomSheet {
            Text("")
        }
    }
}
