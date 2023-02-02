// Double+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Форматирование для кастомного слайдера
extension Double {
    func convert(fromRange: (Double, Double), toRange: (Double, Double)) -> Double {
        var value = self
        value -= fromRange.0
        value /= Double(fromRange.1 - fromRange.0)
        value *= toRange.1 - toRange.0
        value += toRange.0
        return value
    }
}
