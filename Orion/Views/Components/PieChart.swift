//
//  PieChart.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/25/24.
//

import Foundation
import SwiftUI
import UIKit
struct PieChart: View {
    let data: [(String, Double)]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<data.count, id: \.self) { index in
                    PieSlice(startAngle: startAngle(for: index), endAngle: endAngle(for: index))
                        .fill(Color.random)
                }
            }
        }
    }
    
    private func startAngle(for index: Int) -> Angle {
        let sum = data.prefix(index).reduce(0) { $0 + $1.1 }
        return Angle(degrees: sum / total * 360)
    }
    
    private func endAngle(for index: Int) -> Angle {
        let sum = data.prefix(index + 1).reduce(0) { $0 + $1.1 }
        return Angle(degrees: sum / total * 360)
    }
    
    private var total: Double {
        data.reduce(0) { $0 + $1.1 }
    }
}
