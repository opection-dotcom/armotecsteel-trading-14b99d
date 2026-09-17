import SwiftUI

struct SupplyChainTimelineView: View {
    let steps = SteelRepository.supplyChainSteps
    @State private var activeStepIndex: Int = 2 // Gebze Port default focus

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            // Header
            VStack(alignment: .leading, spacing: 4) {
                Text("HOW IT WORKS")
                    .font(.caption)
                    .fontWeight(.bold)
                    .tracking(1.2)
                    .foregroundStyle(Theme.accent)

                Text("5-Step Supply-Chain Framework")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.textPrimary)

                Text("From primary European & Turkish mills to Just-In-Time factory delivery via Gebze Port Free Economic Zone.")
                    .font(.footnote)
                    .foregroundStyle(Theme.textSecondary)
            }

            // Step Progress Cards
            VStack(spacing: Spacing.sm) {
                ForEach(steps) { step in
                    let isSelected = activeStepIndex == step.id

                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            activeStepIndex = step.id
                        }
                    } label: {
                        HStack(alignment: .top, spacing: Spacing.sm) {
                            // Step Number Pin
                            VStack(spacing: 4) {
                                ZStack {
                                    Circle()
                                        .fill(isSelected ? Theme.accent : Theme.surfaceRaised)
                                        .frame(width: 36, height: 36)
                                    Text(step.stepNumber)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundStyle(isSelected ? Theme.onAccent : Theme.steelLight)
                                }
                                if step.id < 5 {
                                    Rectangle()
                                        .fill(Theme.surfaceBorder)
                                        .frame(width: 2, height: 26)
                                }
                            }

                            // Content Details
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(step.title)
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundStyle(Theme.textPrimary)
                                    Spacer()
                                    TechnicalBadge(text: step.highlight, isAccent: isSelected)
                                }

                                Text(step.detail)
                                    .font(.caption)
                                    .foregroundStyle(Theme.textSecondary)
                                    .lineSpacing(2)
                                    .multilineTextAlignment(.leading)

                                HStack(spacing: 4) {
                                    Image(systemName: "mappin.circle.fill")
                                        .font(.caption2)
                                        .foregroundStyle(Theme.accent)
                                    Text(step.hubLocation)
                                        .font(.caption2)
                                        .foregroundStyle(Theme.textMuted)
                                }
                                .padding(.top, 2)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(Spacing.sm)
                        .background(isSelected ? Theme.surfaceRaised : Theme.surface)
                        .clipShape(RoundedRectangle(cornerRadius: Radius.md))
                        .overlay(
                            RoundedRectangle(cornerRadius: Radius.md)
                                .strokeBorder(
                                    isSelected ? Theme.accent.opacity(0.4) : Theme.surfaceBorder,
                                    lineWidth: 1
                                )
                        )
                    }
                    .buttonStyle(PressFeedbackStyle())
                }
            }
        }
        .padding(Spacing.md)
        .background(Theme.backgroundSecondary)
        .clipShape(RoundedRectangle(cornerRadius: Radius.lg))
    }
}
