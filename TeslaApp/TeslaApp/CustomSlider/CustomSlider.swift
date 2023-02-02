// CustomSlider.swift
// Copyright © RoadMap. All rights reserved.

import SwiftUI

/// Кастомный слайдер
struct CustomSlider<Component: View>: View {
    // MARK: - Public Properties

    @Binding var value: Double

    var body: some View {
        GeometryReader { geometry in
            self.view(geometry: geometry)
        }
    }

    // MARK: - Private Properties

    private let viewBuilder: (CustomSliderComponents) -> Component
    private var range: (Double, Double)
    private var knobWidth: CGFloat?

    // MARK: - Initializers

    init(
        value: Binding<Double>,
        range: (Double, Double),
        knobWidth: CGFloat? = nil,
        _ viewBuilder: @escaping (CustomSliderComponents) -> Component
    ) {
        _value = value
        self.range = range
        self.viewBuilder = viewBuilder
        self.knobWidth = knobWidth
    }

    // MARK: - Private methods

    private func view(geometry: GeometryProxy) -> some View {
        let frame = geometry.frame(in: .global)
        let drag = DragGesture(minimumDistance: 0)
            .onChanged { drag in
                self.onDragChange(drag, frame)
            }

        let offsetX = getOffsetX(frame: frame)
        let knobSize = CGSize(width: knobWidth ?? frame.height, height: frame.height)
        let barLeftSize = CGSize(width: CGFloat(offsetX + knobSize.width * 0.5), height: frame.height)
        let barRightSize = CGSize(width: frame.width - barLeftSize.width, height: frame.height)

        let modifiers = CustomSliderComponents(
            barLeft: CustomSliderModifier(name: .barLeft, size: barLeftSize, offset: 0),
            barRight: CustomSliderModifier(name: .barRight, size: barRightSize, offset: barLeftSize.width),
            knob: CustomSliderModifier(name: .knob, size: knobSize, offset: offsetX)
        )

        return ZStack { viewBuilder(modifiers).gesture(drag) }
    }

    private func onDragChange(_ drag: DragGesture.Value, _ frame: CGRect) {
        let width = (knob: Double(knobWidth ?? frame.size.height), view: Double(frame.size.width))
        let xrange = (min: Double(0), max: Double(width.view - width.knob))
        var value = Double(drag.startLocation.x + drag.translation.width) // knob center x
        value -= 0.5 * width.knob // offset from center to leading edge of knob
        value = value > xrange.max ? xrange.max : value // limit to leading edge
        value = value < xrange.min ? xrange.min : value // limit to trailing edge
        value = value.convert(fromRange: (xrange.min, xrange.max), toRange: range)
        self.value = value
    }

    private func getOffsetX(frame: CGRect) -> CGFloat {
        let width = (knob: knobWidth ?? frame.size.height, view: frame.size.width)
        let xrange: (Double, Double) = (0, Double(width.view - width.knob))
        let result = value.convert(fromRange: range, toRange: xrange)
        return CGFloat(result)
    }
}
