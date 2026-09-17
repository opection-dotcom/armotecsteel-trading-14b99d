import SwiftUI

struct QualityCertificatesSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            // Header
            VStack(alignment: .leading, spacing: 4) {
                Text("ASSURANCE & COMPLIANCE")
                    .font(.caption)
                    .fontWeight(.bold)
                    .tracking(1.2)
                    .foregroundStyle(Theme.accent)

                Text("Certificates & Quality Framework")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.textPrimary)

                Text("Armotec Steel supplies engineering steel according to recognized international quality requirements.")
                    .font(.footnote)
                    .foregroundStyle(Theme.textSecondary)
            }

            // Quality Cards
            VStack(spacing: Spacing.sm) {
                QualityCard(
                    title: "EN 10204 Certification",
                    badge: "Inspection Documents",
                    detail: "Material documentation confirms origin and technical parameters for chemical composition and mechanical properties.",
                    icon: "doc.badge.gearshape.fill"
                )

                QualityCard(
                    title: "ISO 9001 Compliance",
                    badge: "Quality Management",
                    detail: "Quality management processes comply with ISO 9001 requirements across trading, storage, and customer fulfillment.",
                    icon: "checkmark.seal.fill"
                )
            }

            // Additional Notice Box
            HStack(alignment: .top, spacing: Spacing.sm) {
                Image(systemName: "info.circle.fill")
                    .font(.subheadline)
                    .foregroundStyle(Theme.accent)

                Text("Additional EN certificates and documentation are available upon request depending on product type and application. Contact Armotec for availability and details.")
                    .font(.caption2)
                    .foregroundStyle(Theme.textSecondary)
                    .lineSpacing(2)
            }
            .padding(Spacing.sm)
            .background(Theme.surfaceRaised)
            .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
            .overlay(
                RoundedRectangle(cornerRadius: Radius.sm)
                    .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
            )
        }
        .padding(Spacing.md)
        .background(Theme.surface)
        .clipShape(RoundedRectangle(cornerRadius: Radius.lg))
        .overlay(
            RoundedRectangle(cornerRadius: Radius.lg)
                .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
        )
    }
}

struct QualityCard: View {
    let title: String
    let badge: String
    let detail: String
    let icon: String

    var body: some View {
        HStack(alignment: .top, spacing: Spacing.sm) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(Theme.accent)
                .frame(width: 36, height: 36)
                .background(Theme.accentWash)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(Theme.textPrimary)
                    Spacer()
                    TechnicalBadge(text: badge, isAccent: true)
                }

                Text(detail)
                    .font(.caption)
                    .foregroundStyle(Theme.textSecondary)
                    .lineSpacing(2)
            }
        }
        .padding(Spacing.sm)
        .background(Theme.surfaceRaised)
        .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
        .overlay(
            RoundedRectangle(cornerRadius: Radius.sm)
                .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
        )
    }
}
