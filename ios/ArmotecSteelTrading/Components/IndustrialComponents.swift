import SwiftUI

// MARK: - Metallic Industrial Card Modifier
struct IndustrialCardModifier: ViewModifier {
    var isElevated: Bool = false
    var accentBorder: Bool = false

    func body(content: Content) -> some View {
        content
            .padding(Spacing.md)
            .background(
                RoundedRectangle(cornerRadius: Radius.md)
                    .fill(isElevated ? Theme.surfaceRaised : Theme.surface)
            )
            .overlay(
                RoundedRectangle(cornerRadius: Radius.md)
                    .strokeBorder(
                        accentBorder ? Theme.accent.opacity(0.4) : Theme.surfaceBorder,
                        lineWidth: 1
                    )
            )
            .shadow(color: Color.black.opacity(isElevated ? 0.35 : 0.20), radius: isElevated ? 10 : 5, y: isElevated ? 4 : 2)
    }
}

extension View {
    func industrialCard(isElevated: Bool = false, accentBorder: Bool = false) -> some View {
        modifier(IndustrialCardModifier(isElevated: isElevated, accentBorder: accentBorder))
    }
}

// MARK: - Primary Industrial Button
struct PrimaryIndustrialButton: View {
    let title: String
    let icon: String?
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: Spacing.xs) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.headline)
                }
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Theme.onAccent)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Theme.amberGradient)
            .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
            .shadow(color: Theme.accent.opacity(0.35), radius: 8, y: 3)
            .contentShape(Rectangle())
        }
        .buttonStyle(PressFeedbackStyle())
    }
}

// MARK: - Secondary Industrial Button
struct SecondaryIndustrialButton: View {
    let title: String
    let icon: String?
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: Spacing.xs) {
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(Theme.steelLight)
            .padding(.horizontal, Spacing.md)
            .frame(height: 44)
            .background(Theme.surfaceRaised)
            .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
            .overlay(
                RoundedRectangle(cornerRadius: Radius.sm)
                    .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
            )
        }
        .buttonStyle(PressFeedbackStyle())
    }
}

// MARK: - Press feedback style
struct PressFeedbackStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .opacity(configuration.isPressed ? 0.88 : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}

// MARK: - Technical Metric Chip
struct TechnicalBadge: View {
    let text: String
    var isAccent: Bool = false

    var body: some View {
        Text(text)
            .font(.caption2)
            .fontWeight(.semibold)
            .foregroundStyle(isAccent ? Theme.accent : Theme.steelLight)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(isAccent ? Theme.accentWash : Theme.surfaceRaised)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(isAccent ? Theme.accent.opacity(0.3) : Theme.surfaceBorder, lineWidth: 0.8)
            )
    }
}

// MARK: - Steel Grid Texture Background
struct SteelBackgroundView: View {
    var body: some View {
        ZStack {
            Theme.background
                .ignoresSafeArea()

            // Subtle industrial ambient top glow
            RadialGradient(
                colors: [Theme.accent.opacity(0.08), Color.clear],
                center: .top,
                startRadius: 20,
                endRadius: 360
            )
            .ignoresSafeArea()

            // Metallic technical draft lines
            Canvas { context, size in
                let step: CGFloat = 36
                var x: CGFloat = 0
                while x < size.width {
                    var path = Path()
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(to: CGPoint(x: x, y: size.height))
                    context.stroke(path, with: .color(Color.white.opacity(0.015)), lineWidth: 0.5)
                    x += step
                }
                var y: CGFloat = 0
                while y < size.height {
                    var path = Path()
                    path.move(to: CGPoint(x: 0, y: y))
                    path.addLine(to: CGPoint(x: size.width, y: y))
                    context.stroke(path, with: .color(Color.white.opacity(0.015)), lineWidth: 0.5)
                    y += step
                }
            }
            .ignoresSafeArea()
            .allowsHitTesting(false)
        }
    }
}
