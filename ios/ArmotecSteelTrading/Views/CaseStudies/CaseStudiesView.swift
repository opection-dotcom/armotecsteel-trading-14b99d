import SwiftUI

struct CaseStudiesView: View {
    let caseStudies = SteelRepository.caseStudies
    let onRequestQuote: () -> Void

    var body: some View {
        NavigationStack {
            ZStack {
                SteelBackgroundView()

                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.md) {
                        // Section Header
                        VStack(alignment: .leading, spacing: 4) {
                            Text("PROVEN TRACK RECORD")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(1.2)
                                .foregroundStyle(Theme.accent)

                            Text("Engineering Case Studies")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(Theme.textPrimary)

                            Text("See how Armotec's free-zone buffer stock model delivered 7-day turnaround and eliminated downtime for leading OEM manufacturers.")
                                .font(.footnote)
                                .foregroundStyle(Theme.textSecondary)
                        }
                        .padding(.top, Spacing.xs)

                        // Key Statistics Grid
                        VStack(spacing: Spacing.xs) {
                            HStack(spacing: Spacing.xs) {
                                LargeStatCard(stat: "20+ YEARS", label: "Steel Industry Experience")
                                LargeStatCard(stat: "9+ YEARS", label: "International Supply Experience")
                            }
                            HStack(spacing: Spacing.xs) {
                                LargeStatCard(stat: "6,000+ TONS", label: "Annual Shipment Volume")
                                LargeStatCard(stat: "3 REGIONS+", label: "Turkey • MENA • Europe")
                            }
                        }

                        // Case Study Cards
                        VStack(spacing: Spacing.md) {
                            ForEach(caseStudies) { study in
                                CaseStudyCard(study: study)
                            }
                        }

                        // Quality Trust Section Embed
                        QualityCertificatesSection()

                        // CTA
                        PrimaryIndustrialButton(
                            title: "Discuss Your Project Requirements",
                            icon: "bubble.left.and.text.bubble.right.fill"
                        ) {
                            onRequestQuote()
                        }
                        .padding(.top, Spacing.xs)

                        Spacer(minLength: Spacing.huge)
                    }
                    .padding(Spacing.screenMargin)
                }
            }
            .navigationTitle("Case Studies")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Case Study Card
struct CaseStudyCard: View {
    let study: CaseStudy

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            // Header
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(study.clientSector.uppercased())
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(Theme.accent)

                    Text(study.projectTitle)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(Theme.textPrimary)

                    HStack(spacing: 4) {
                        Image(systemName: "mappin.circle.fill")
                            .font(.caption2)
                            .foregroundStyle(Theme.textMuted)
                        Text(study.location)
                            .font(.caption2)
                            .foregroundStyle(Theme.textMuted)
                    }
                }

                Spacer()

                TechnicalBadge(text: study.leadTimeStat, isAccent: true)
            }

            // Materials Supplied Chip List
            VStack(alignment: .leading, spacing: 4) {
                Text("MATERIALS SUPPLIED:")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.steelLight)

                ForEach(study.productsSupplied, id: \.self) { prod in
                    HStack(spacing: 6) {
                        Image(systemName: "shippingbox.fill")
                            .font(.caption2)
                            .foregroundStyle(Theme.accent)
                        Text(prod)
                            .font(.caption)
                            .foregroundStyle(Theme.textSecondary)
                    }
                }
            }
            .padding(Spacing.xs)
            .background(Theme.surfaceRaised)
            .clipShape(RoundedRectangle(cornerRadius: Radius.sm))

            // Challenge -> Solution Flow
            VStack(alignment: .leading, spacing: 6) {
                VStack(alignment: .leading, spacing: 2) {
                    Label("Challenge", systemImage: "exclamationmark.circle.fill")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.red.opacity(0.85))
                    Text(study.challenge)
                        .font(.caption)
                        .foregroundStyle(Theme.textSecondary)
                        .lineSpacing(2)
                }

                Divider()
                    .overlay(Theme.surfaceBorder)

                VStack(alignment: .leading, spacing: 2) {
                    Label("Armotec Solution", systemImage: "checkmark.circle.fill")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(Theme.accent)
                    Text(study.solution)
                        .font(.caption)
                        .foregroundStyle(Theme.textSecondary)
                        .lineSpacing(2)
                }
            }
            .padding(Spacing.xs)
            .background(Theme.surfaceRaised)
            .clipShape(RoundedRectangle(cornerRadius: Radius.sm))

            // Measurable Results
            VStack(alignment: .leading, spacing: 4) {
                Text("MEASURABLE RESULTS:")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.steelLight)

                ForEach(study.measurableResults, id: \.self) { res in
                    HStack(spacing: 6) {
                        Image(systemName: "checkmark.shield.fill")
                            .font(.caption2)
                            .foregroundStyle(Theme.accent)
                        Text(res)
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundStyle(Theme.textPrimary)
                    }
                }
            }
        }
        .industrialCard(isElevated: true, accentBorder: false)
    }
}

// MARK: - Large Stat Card
struct LargeStatCard: View {
    let stat: String
    let label: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(stat)
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(Theme.accent)
            Text(label)
                .font(.system(size: 10, weight: .medium))
                .foregroundStyle(Theme.textSecondary)
                .lineLimit(1)
        }
        .padding(Spacing.sm)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Theme.surface)
        .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
        .overlay(
            RoundedRectangle(cornerRadius: Radius.sm)
                .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
        )
    }
}
