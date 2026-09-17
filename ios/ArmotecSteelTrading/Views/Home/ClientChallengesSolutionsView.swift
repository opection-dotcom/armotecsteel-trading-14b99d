import SwiftUI

struct ClientChallengesSolutionsView: View {
    @State private var selectedChallengeID: Int = 1
    let onRequestQuote: () -> Void

    let items = SteelRepository.challengesAndSolutions

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            // Section Header
            VStack(alignment: .leading, spacing: 4) {
                Text("SUPPLY CHAIN RESILIENCE")
                    .font(.caption)
                    .fontWeight(.bold)
                    .tracking(1.2)
                    .foregroundStyle(Theme.accent)

                Text("Client Challenges & Armotec Solutions")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.textPrimary)

                Text("Tap each operational constraint to see how our free-zone buffer stock model mitigates procurement risk for OEMs.")
                    .font(.footnote)
                    .foregroundStyle(Theme.textSecondary)
            }

            // Interactive Flow Visualizer Banner
            HStack(spacing: 4) {
                FlowStepBadge(title: "Demand", icon: "person.badge.shield.checkmark.fill")
                Image(systemName: "arrow.right")
                    .font(.caption2)
                    .foregroundStyle(Theme.accent)
                FlowStepBadge(title: "Sourcing", icon: "building.2.fill")
                Image(systemName: "arrow.right")
                    .font(.caption2)
                    .foregroundStyle(Theme.accent)
                FlowStepBadge(title: "Buffer Stock", icon: "shippingbox.fill", isHighlight: true)
                Image(systemName: "arrow.right")
                    .font(.caption2)
                    .foregroundStyle(Theme.accent)
                FlowStepBadge(title: "Customs", icon: "doc.badge.shield")
                Image(systemName: "arrow.right")
                    .font(.caption2)
                    .foregroundStyle(Theme.accent)
                FlowStepBadge(title: "OEM JIT", icon: "truck.box.fill")
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(Theme.backgroundSecondary)
            .clipShape(RoundedRectangle(cornerRadius: Radius.sm))

            // Selector Tabs
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(items) { item in
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedChallengeID = item.id
                            }
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: item.icon)
                                    .font(.caption)
                                Text("\(item.id). \(item.challengeTitle)")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(
                                selectedChallengeID == item.id ?
                                Theme.accent : Theme.surfaceRaised
                            )
                            .foregroundStyle(
                                selectedChallengeID == item.id ?
                                Theme.onAccent : Theme.steelLight
                            )
                            .clipShape(Capsule())
                        }
                    }
                }
            }

            // Active Card Comparison
            if let selected = items.first(where: { $0.id == selectedChallengeID }) {
                VStack(spacing: Spacing.sm) {
                    // OEM Challenge Box
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Label("OEM Problem", systemImage: "exclamationmark.triangle.fill")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.red.opacity(0.85))
                            Spacer()
                            Text("Traditional Mill Channel")
                                .font(.caption2)
                                .foregroundStyle(Theme.textMuted)
                        }
                        Text(selected.challengeTitle)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(Theme.textPrimary)
                        Text(selected.challengeDetail)
                            .font(.footnote)
                            .foregroundStyle(Theme.textSecondary)
                            .lineSpacing(2)
                    }
                    .padding(Spacing.sm)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.red.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
                    .overlay(
                        RoundedRectangle(cornerRadius: Radius.sm)
                            .strokeBorder(Color.red.opacity(0.2), lineWidth: 1)
                    )

                    // Armotec Solution Box
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Label("Armotec Engineered Solution", systemImage: "checkmark.seal.fill")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(Theme.accent)
                            Spacer()
                            TechnicalBadge(text: selected.metricBadge, isAccent: true)
                        }
                        Text(selected.solutionTitle)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(Theme.textPrimary)
                        Text(selected.solutionDetail)
                            .font(.footnote)
                            .foregroundStyle(Theme.textSecondary)
                            .lineSpacing(2)
                    }
                    .padding(Spacing.sm)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Theme.surfaceRaised)
                    .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
                    .overlay(
                        RoundedRectangle(cornerRadius: Radius.sm)
                            .strokeBorder(Theme.accent.opacity(0.4), lineWidth: 1)
                    )
                }
                .padding(Spacing.sm)
                .background(Theme.surface)
                .clipShape(RoundedRectangle(cornerRadius: Radius.md))
                .overlay(
                    RoundedRectangle(cornerRadius: Radius.md)
                        .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
                )
            }
        }
        .padding(Spacing.md)
        .background(Theme.backgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: Radius.lg))
    }
}

struct FlowStepBadge: View {
    let title: String
    let icon: String
    var isHighlight: Bool = false

    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: icon)
                .font(.caption2)
                .foregroundStyle(isHighlight ? Theme.accent : Theme.steelLight)
            Text(title)
                .font(.system(size: 9, weight: .bold))
                .foregroundStyle(isHighlight ? Theme.accent : Theme.textSecondary)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
    }
}
