import SwiftUI

enum Theme {
    // Backgrounds & Base
    static let background = Color(red: 0.07, green: 0.08, blue: 0.10) // #121419 Deep Titanium Charcoal
    static let backgroundSecondary = Color(red: 0.10, green: 0.12, blue: 0.15) // #1A1E26
    static let backgroundElevated = Color(red: 0.13, green: 0.16, blue: 0.20) // #212833

    // Surfaces & Cards
    static let surface = Color(red: 0.12, green: 0.14, blue: 0.18) // #1F242E
    static let surfaceRaised = Color(red: 0.16, green: 0.19, blue: 0.24) // #29303D
    static let surfaceTinted = Color(red: 0.14, green: 0.18, blue: 0.25) // Cold steel tint
    static let surfaceBorder = Color(red: 0.22, green: 0.26, blue: 0.32) // Crisp metallic hairline

    // Metallic Accents
    static let steel = Color(red: 0.70, green: 0.75, blue: 0.82) // Brushed steel
    static let steelLight = Color(red: 0.88, green: 0.92, blue: 0.96)
    static let steelDark = Color(red: 0.35, green: 0.40, blue: 0.48)

    // Primary Brand Accent (Industrial Copper / High-Visibility Amber)
    static let accent = Color(red: 0.95, green: 0.58, blue: 0.20) // #F29433 Industrial Molten Amber
    static let accentStrong = Color(red: 0.98, green: 0.68, blue: 0.30)
    static let accentWash = Color(red: 0.95, green: 0.58, blue: 0.20).opacity(0.14)
    static let accentGhost = Color(red: 0.95, green: 0.58, blue: 0.20).opacity(0.06)
    static let onAccent = Color(red: 0.06, green: 0.07, blue: 0.09) // High-contrast dark ink on bright amber

    // Status & Badges
    static let success = Color(red: 0.22, green: 0.75, blue: 0.48)
    static let info = Color(red: 0.25, green: 0.62, blue: 0.92)
    static let warning = Color(red: 0.98, green: 0.72, blue: 0.22)

    // Text & Ink
    static let textPrimary = Color(red: 0.96, green: 0.97, blue: 0.98)
    static let textSecondary = Color(red: 0.68, green: 0.73, blue: 0.80)
    static let textMuted = Color(red: 0.45, green: 0.50, blue: 0.58)

    // Hero Gradient Pair
    static let heroGradient = LinearGradient(
        colors: [
            Color(red: 0.12, green: 0.16, blue: 0.22),
            Color(red: 0.07, green: 0.08, blue: 0.10)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let metallicGradient = LinearGradient(
        colors: [
            Color(red: 0.22, green: 0.27, blue: 0.35),
            Color(red: 0.12, green: 0.15, blue: 0.20)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let amberGradient = LinearGradient(
        colors: [
            Color(red: 0.98, green: 0.64, blue: 0.22),
            Color(red: 0.90, green: 0.46, blue: 0.12)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

enum Spacing {
    static let xxs: CGFloat = 4
    static let xs: CGFloat = 8
    static let sm: CGFloat = 12
    static let md: CGFloat = 16
    static let lg: CGFloat = 20
    static let xl: CGFloat = 24
    static let xxl: CGFloat = 32
    static let huge: CGFloat = 48
    static let screenMargin: CGFloat = 16
}

enum Radius {
    static let sm: CGFloat = 8
    static let md: CGFloat = 12
    static let lg: CGFloat = 16
    static let xl: CGFloat = 22
    static let sheet: CGFloat = 24
}
