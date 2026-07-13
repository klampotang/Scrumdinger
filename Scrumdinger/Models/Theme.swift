/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

public enum Theme: String, CaseIterable, Identifiable, Codable {

    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    public var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    public var mainColor: Color {
        switch self {
        case .bubblegum:   return Color(red: 1.0,  green: 0.6,  blue: 0.78)
        case .buttercup:   return Color(red: 1.0,  green: 0.85, blue: 0.2)
        case .indigo:      return Color(red: 0.29, green: 0.0,  blue: 0.51)
        case .lavender:    return Color(red: 0.71, green: 0.49, blue: 0.86)
        case .magenta:     return Color(red: 0.79, green: 0.08, blue: 0.52)
        case .navy:        return Color(red: 0.0,  green: 0.0,  blue: 0.5)
        case .orange:      return Color(red: 1.0,  green: 0.55, blue: 0.0)
        case .oxblood:     return Color(red: 0.31, green: 0.0,  blue: 0.02)
        case .periwinkle:  return Color(red: 0.6,  green: 0.6,  blue: 1.0)
        case .poppy:       return Color(red: 0.87, green: 0.19, blue: 0.18)
        case .purple:      return Color(red: 0.5,  green: 0.0,  blue: 0.5)
        case .seafoam:     return Color(red: 0.56, green: 0.94, blue: 0.85)
        case .sky:         return Color(red: 0.53, green: 0.81, blue: 0.98)
        case .tan:         return Color(red: 0.82, green: 0.71, blue: 0.55)
        case .teal:        return Color(red: 0.0,  green: 0.5,  blue: 0.5)
        case .yellow:      return Color(red: 1.0,  green: 0.9,  blue: 0.0)
        }
    }
    public var name: String {
        rawValue.capitalized
    }
    public var id: String {
        name
    }
}
