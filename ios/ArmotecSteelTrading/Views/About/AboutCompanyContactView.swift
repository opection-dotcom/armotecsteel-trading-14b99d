import SwiftUI

struct AboutCompanyContactView: View {
    let onRequestQuote: () -> Void

    var body: some View {
        NavigationStack {
            ZStack {
                SteelBackgroundView()

                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.md) {
                        // Section Header
                        VStack(alignment: .leading, spacing: 4) {
                            Text("COMPANY IDENTITY & GOVERNANCE")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(1.2)
                                .foregroundStyle(Theme.accent)

                            Text("About Armotec Steel Trading")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(Theme.textPrimary)

                            Text("Armotec Steel Trading FZCO is a Dubai-based international engineering steel trading and supply-chain solutions company.")
                                .font(.footnote)
                                .foregroundStyle(Theme.textSecondary)
                        }
                        .padding(.top, Spacing.xs)

                        // Company Story & Facts Card
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            HStack {
                                Text("CORPORATE PROFILE")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Theme.accent)
                                Spacer()
                                TechnicalBadge(text: "Founded \(CompanyData.founded)", isAccent: false)
                            }

                            Text("Armotec Steel Trading FZCO supplies engineering steel long and flat products and composite materials, accompanied by robust supply-chain risk mitigation frameworks.")
                                .font(.subheadline)
                                .foregroundStyle(Theme.textPrimary)
                                .lineSpacing(2)

                            Text("With an affiliate trading company in Maltepe, Istanbul, Turkey, our leadership team combines more than 20 years of experience in the steel business and more than 9 years of international supply expertise within the group. We operate across Turkey, MENA and the European Union, sourcing directly from premier mills and maintaining buffer stock in the free economic zone of Gebze Port, Istanbul.")
                                .font(.caption)
                                .foregroundStyle(Theme.textSecondary)
                                .lineSpacing(3)
                        }
                        .industrialCard(isElevated: true, accentBorder: false)

                        // 10 Key Corporate Advantages
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("ARMOTEC ADVANTAGES")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(1.2)
                                .foregroundStyle(Theme.accent)

                            AdvantagesGrid()
                        }
                        .industrialCard()

                        // Direct Contact & Headquarters Card
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("DIRECT CONTACT & LOCATIONS")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(1.2)
                                .foregroundStyle(Theme.accent)

                            Text("Let's check if our offer meets your requirements")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(Theme.textPrimary)

                            Text("Tell us which materials or steel grades you are interested in, and our team will get back to you with availability, delivery options and technical details.")
                                .font(.caption)
                                .foregroundStyle(Theme.textSecondary)

                            // Fast Actions: Call & Email
                            VStack(spacing: Spacing.xs) {
                                if let phoneUrl = URL(string: "tel:\(CompanyData.phoneClean)") {
                                    Link(destination: phoneUrl) {
                                        HStack {
                                            Image(systemName: "phone.fill")
                                            Text("Call \(CompanyData.phone)")
                                                .fontWeight(.bold)
                                        }
                                        .font(.subheadline)
                                        .foregroundStyle(Theme.onAccent)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 44)
                                        .background(Theme.amberGradient)
                                        .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
                                    }
                                }

                                if let emailUrl = URL(string: "mailto:\(CompanyData.email)") {
                                    Link(destination: emailUrl) {
                                        HStack {
                                            Image(systemName: "envelope.fill")
                                            Text("Email \(CompanyData.email)")
                                                .fontWeight(.semibold)
                                        }
                                        .font(.subheadline)
                                        .foregroundStyle(Theme.steelLight)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 44)
                                        .background(Theme.surfaceRaised)
                                        .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: Radius.sm)
                                                .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
                                        )
                                    }
                                }
                            }
                            .padding(.vertical, 4)

                            // Address Details
                            VStack(alignment: .leading, spacing: 6) {
                                OfficeLocationRow(
                                    city: "Dubai Headquarters (UAE)",
                                    address: CompanyData.headOffice,
                                    licenseInfo: "License No: \(CompanyData.licenseNo) | Corporate Tax: \(CompanyData.corporateTaxNo)"
                                )

                                Divider().overlay(Theme.surfaceBorder)

                                OfficeLocationRow(
                                    city: "Istanbul Affiliate Office",
                                    address: CompanyData.affiliateOffice,
                                    licenseInfo: "European & Turkish Operations"
                                )

                                Divider().overlay(Theme.surfaceBorder)

                                OfficeLocationRow(
                                    city: "Free Economic Zone Warehouse",
                                    address: CompanyData.warehouseHub,
                                    licenseInfo: "Annual Shipment Volume: \(CompanyData.annualVolume)"
                                )
                            }
                            .padding(Spacing.xs)
                            .background(Theme.surfaceRaised)
                            .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
                        }
                        .industrialCard()

                        // Primary CTA
                        PrimaryIndustrialButton(
                            title: "Request a Quote / Discuss Requirements",
                            icon: "doc.text.badge.plus"
                        ) {
                            onRequestQuote()
                        }
                        .padding(.top, Spacing.xs)

                        // Footer Transparency
                        VStack(spacing: 4) {
                            Text("© \(Calendar.current.component(.year, from: Date())) \(CompanyData.name)")
                                .font(.caption2)
                                .foregroundStyle(Theme.textMuted)
                            Text("Reliable engineering steel. Flexible quantities. Buffer stock. Predictable logistics.")
                                .font(.system(size: 9))
                                .foregroundStyle(Theme.textMuted)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, Spacing.sm)

                        Spacer(minLength: Spacing.huge)
                    }
                    .padding(Spacing.screenMargin)
                }
            }
            .navigationTitle("About & Contact")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Advantages Grid
struct AdvantagesGrid: View {
    let advantages = [
        "20+ years steel-industry experience",
        "9+ years international supply experience",
        "Strong engineering-steel expertise",
        "Established relationships with steel mills",
        "Strong distributor network",
        "Organized European logistics",
        "Competitive freight options",
        "Dubai & Istanbul operational offices",
        "Free-zone warehouse at Gebze Port",
        "Flexible treatment for companies of all sizes"
    ]

    var body: some View {
        VStack(spacing: 6) {
            ForEach(advantages, id: \.self) { adv in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.caption)
                        .foregroundStyle(Theme.accent)
                    Text(adv)
                        .font(.caption)
                        .foregroundStyle(Theme.steelLight)
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Office Location Row
struct OfficeLocationRow: View {
    let city: String
    let address: String
    let licenseInfo: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(city)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Theme.textPrimary)

            Text(address)
                .font(.caption2)
                .foregroundStyle(Theme.textSecondary)

            Text(licenseInfo)
                .font(.system(size: 10))
                .foregroundStyle(Theme.accent)
        }
    }
}
