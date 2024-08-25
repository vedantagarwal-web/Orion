//
//  CustomTabBar.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/25/24.
//

import Foundation
import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            ForEach(0..<4) { index in
                Spacer()
                TabBarItem(
                    icon: tabBarItemIcon(for: index),
                    text: tabBarItemText(for: index),
                    isSelected: selectedTab == index
                )
                .onTapGesture {
                    selectedTab = index
                }
                Spacer()
            }
        }
        .padding(.vertical, 10)
        .background(Color.primaryBrand.ignoresSafeArea(edges: .bottom))
    }
    
    private func tabBarItemIcon(for index: Int) -> String {
        switch index {
        case 0: return "house.fill"
        case 1: return "magnifyingglass"
        case 2: return "cart.fill"
        case 3: return "person.fill"
        default: return ""
        }
    }
    
    private func tabBarItemText(for index: Int) -> String {
        switch index {
        case 0: return "Home"
        case 1: return "Search"
        case 2: return "Cart"
        case 3: return "Profile"
        default: return ""
        }
    }
}

struct TabBarItem: View {
    let icon: String
    let text: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 24))
            Text(text)
                .font(.caption)
        }
        .foregroundColor(isSelected ? .highlightBrand : .gray)
    }
}
