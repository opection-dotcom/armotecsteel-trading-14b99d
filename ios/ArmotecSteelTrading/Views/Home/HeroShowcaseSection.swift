import SwiftUI

struct HeroShowcaseSection: View {
    let onRequestQuote: () -> Void
    let onExploreProducts: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.lg) {
            // Eyebrow Tag
            HStack(spacing: 6) {
                Circle()
                    .fill(Theme.accent)
                    .frame(width: 8, height: 8)
                Text("DUBAI • ISTANBUL • EUROPE")
                    .font(.caption)
                    .fontWeight(.bold)
                    .tracking(1.2)
                    .foregroundStyle(Theme.accent)
                Spacer()
                Text("FZCO REG: 48866")
                    .font(.caption2)
                    .foregroundStyle(Theme.textMuted)
            }

            // Main Industrial Headline
            VStack(alignment: .leading, spacing: 6) {
                Text("Advanced steel solutions for the engineering industry")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundStyle(Theme.textPrimary)
                    .lineSpacing(2)

                Text("Engineering steel and composite materials for OEM manufacturers, supported by reliable sourcing, buffer stock and predictable international logistics.")
                    .font(.subheadline)
                    .foregroundStyle(Theme.textSecondary)
                    .lineSpacing(3)
            }

            // CTAs
            VStack(spacing: Spacing.sm) {
                PrimaryIndustrialButton(
                    title: "Request a Quote",
                    icon: "doc.text.badge.plus"
                ) {
                    onRequestQuote()
                }

                SecondaryIndustrialButton(
                    title: "Explore Products & Buffer Stock",
                    icon: "square.grid.2x2"
                ) {
                    onExploreProducts()
                }
                .frame(maxWidth: .infinity)
            }

            // Trust Indicators 4-Up Grid
            VStack(spacing: Spacing.xs) {
                HStack(spacing: Spacing.xs) {
                    TrustBadgeCard(
                        number: "20+ Years",
                        label: "Steel Experience",
                        icon: "shield.fill"
                    )
                    TrustBadgeCard(
                        number: "6,000+ Tons",
                        label: "Annual Shipments",
                        icon: "shippingbox.fill"
                    )
                }
                HStack(spacing: Spacing.xs) {
                    TrustBadgeCard(
                        number: "Turkey • MENA",
                        label: "European Reach",
                        icon: "globe.europe.africa.fill"
                    )
                    TrustBadgeCard(
                        number: "Gebze Port",
                        label: "Free Zone Buffer Stock",
                        icon: "building.2.fill"
                    )
                }
            }
        }
        .padding(Spacing.md)
        .background(
            RoundedRectangle(cornerRadius: Radius.lg)
                .fill(Theme.surface)
                .overlay(
                    RoundedRectangle(cornerRadius: Radius.lg)
                        .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
                )
        )
    }
}

struct TrustBadgeCard: View {
    let number: String
    let label: String
    let icon: String

    var body: some View {
        HStack(spacing: Spacing.xs) {
            Image(systemName: icon)
                .font(.headline)
                .foregroundStyle(Theme.accent)
                .frame(width: 28)

            VStack(alignment: .leading, spacing: 2) {
                Text(number)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.textPrimary)
                Text(label)
                    .font(.caption2)
                    .foregroundStyle(Theme.textMuted)
                    .lineLimit(1)
            }
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Theme.surfaceRaised)
        .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
    }
}
