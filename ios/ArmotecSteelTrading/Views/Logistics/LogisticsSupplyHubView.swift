import SwiftUI

struct LogisticsSupplyHubView: View {
    let onRequestQuote: () -> Void

    var body: some View {
        NavigationStack {
            ZStack {
                SteelBackgroundView()

                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.md) {
                        // Section Header
                        VStack(alignment: .leading, spacing: 4) {
                            Text("GLOBAL LOGISTICS & BUFFER HUBS")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(1.2)
                                .foregroundStyle(Theme.accent)

                            Text("International Logistics & Free-Zone Hub")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(Theme.textPrimary)

                            Text("Seamless multimodal steel transport connecting Gebze Port Free Economic Zone to Europe, MENA, and global OEM production sites.")
                                .font(.footnote)
                                .foregroundStyle(Theme.textSecondary)
                        }
                        .padding(.top, Spacing.xs)

                        // Stylized Interactive Logistics Map
                        InteractiveLogisticsMapCard()

                        // 4 Core Logistics Capabilities
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("KEY LOGISTICS CAPABILITIES")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(1.2)
                                .foregroundStyle(Theme.accent)

                            LogisticsFeatureCard(
                                title: "Gebze Port, Istanbul",
                                subtitle: "Strategic Logistics & Warehouse Hub",
                                detail: "Operating in the free economic zone of Gebze Port, positioned at the maritime and terrestrial junction of European and Asian industrial corridors.",
                                icon: "building.2.crop.between.columns.fill"
                            )

                            LogisticsFeatureCard(
                                title: "Free-Zone Storage & Buffer Stock",
                                subtitle: "Tax-Efficient Inventory Reserves",
                                detail: "Buffer stock allows flexible shipment planning, reduced lead times, and preservation of OEM working capital without upfront customs duties.",
                                icon: "archivebox.fill"
                            )

                            LogisticsFeatureCard(
                                title: "Worldwide Multimodal Delivery",
                                subtitle: "Sea & Land Transportation Routes",
                                detail: "Dedicated trucking fleets and containerized sea freight delivering scheduled batches across Turkey, the Middle East, North Africa, and the EU.",
                                icon: "ferry.fill"
                            )

                            LogisticsFeatureCard(
                                title: "Consolidation & Cross-Docking",
                                subtitle: "Optimized Freight & Transit Schedules",
                                detail: "Cross-docking and multi-product batch consolidation optimize freight economics and eliminate unnecessary transfer delays.",
                                icon: "arrow.triangle.swap"
                            )
                        }

                        // CTA Box
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("Need a tailored logistics schedule or bonded warehouse reservation?")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(Theme.textPrimary)

                            Text("Discuss route planning, customs procedures, and buffer-stock volume holding with our operations desk.")
                                .font(.caption)
                                .foregroundStyle(Theme.textSecondary)

                            PrimaryIndustrialButton(
                                title: "Discuss Logistics Requirements",
                                icon: "truck.box.fill"
                            ) {
                                onRequestQuote()
                            }
                        }
                        .industrialCard(isElevated: true, accentBorder: true)

                        Spacer(minLength: Spacing.huge)
                    }
                    .padding(Spacing.screenMargin)
                }
            }
            .navigationTitle("Logistics & Hubs")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Interactive Logistics Map Card
struct InteractiveLogisticsMapCard: View {
    @State private var activeHub: String = "Gebze Port Hub"

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack {
                Label("Strategic Corridor Map", systemImage: "map.fill")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.accent)
                Spacer()
                Text("Turkey → Europe → MENA")
                    .font(.caption2)
                    .foregroundStyle(Theme.steelLight)
            }

            // Stylized Tactical Map Graphic
            ZStack {
                RoundedRectangle(cornerRadius: Radius.md)
                    .fill(Color(red: 0.08, green: 0.10, blue: 0.13))
                    .frame(height: 200)

                // Tactical Grid
                Canvas { context, size in
                    let step: CGFloat = 20
                    var x: CGFloat = 0
                    while x < size.width {
                        var p = Path()
                        p.move(to: CGPoint(x: x, y: 0))
                        p.addLine(to: CGPoint(x: x, y: size.height))
                        context.stroke(p, with: .color(Color.white.opacity(0.04)), lineWidth: 0.5)
                        x += step
                    }
                }

                // Corridors / Lines
                Path { path in
                    // Europe to Istanbul
                    path.move(to: CGPoint(x: 50, y: 60))
                    path.addQuadCurve(to: CGPoint(x: 170, y: 90), control: CGPoint(x: 100, y: 65))
                    // Istanbul to Dubai
                    path.addQuadCurve(to: CGPoint(x: 290, y: 150), control: CGPoint(x: 240, y: 100))
                    // Istanbul to MENA Port
                    path.addQuadCurve(to: CGPoint(x: 210, y: 160), control: CGPoint(x: 185, y: 130))
                }
                .stroke(
                    Theme.accent.opacity(0.7),
                    style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [5, 4])
                )

                // Nodes
                MapNode(x: 50, y: 60, title: "Europe", isHub: false, isSelected: activeHub == "Europe") {
                    activeHub = "Europe"
                }
                MapNode(x: 170, y: 90, title: "Gebze Hub (FEZ)", isHub: true, isSelected: activeHub == "Gebze Port Hub") {
                    activeHub = "Gebze Port Hub"
                }
                MapNode(x: 290, y: 150, title: "Dubai HQ", isHub: true, isSelected: activeHub == "Dubai HQ") {
                    activeHub = "Dubai HQ"
                }
                MapNode(x: 210, y: 160, title: "MENA", isHub: false, isSelected: activeHub == "MENA") {
                    activeHub = "MENA"
                }
            }

            // Selected Hub Detail Pill
            HStack(spacing: 8) {
                Image(systemName: "info.circle.fill")
                    .foregroundStyle(Theme.accent)
                VStack(alignment: .leading, spacing: 2) {
                    Text(activeHub)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(Theme.textPrimary)
                    Text(hubDescription(for: activeHub))
                        .font(.caption2)
                        .foregroundStyle(Theme.textSecondary)
                }
            }
            .padding(Spacing.xs)
            .background(Theme.surfaceRaised)
            .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .industrialCard()
    }

    private func hubDescription(for hub: String) -> String {
        switch hub {
        case "Gebze Port Hub":
            return "Free Economic Zone Warehouse: 6,000+ tons annual transit with duty-free buffer storage."
        case "Dubai HQ":
            return "Armotec Steel Trading FZCO Headquarters at Dubai Silicon Oasis, managing trade finance."
        case "Europe":
            return "Direct sourcing from certified EU mills with EN 10204 quality documentation."
        case "MENA":
            return "Expanding OEM supply contracts across Saudi Arabia, UAE, and GCC heavy industry."
        default:
            return "Strategic international trading route."
        }
    }
}

struct MapNode: View {
    let x: CGFloat
    let y: CGFloat
    let title: String
    let isHub: Bool
    let isSelected: Bool
    let onSelect: () -> Void

    var body: some View {
        Button(action: onSelect) {
            VStack(spacing: 2) {
                ZStack {
                    if isHub {
                        Circle()
                            .fill(Theme.accent.opacity(0.3))
                            .frame(width: 22, height: 22)
                    }
                    Circle()
                        .fill(isHub ? Theme.accent : Theme.steelLight)
                        .frame(width: 10, height: 10)
                }
                Text(title)
                    .font(.system(size: 9, weight: .bold))
                    .foregroundStyle(isSelected ? Theme.accent : Theme.steelLight)
            }
        }
        .position(x: x, y: y)
    }
}

struct LogisticsFeatureCard: View {
    let title: String
    let subtitle: String
    let detail: String
    let icon: String

    var body: some View {
        HStack(alignment: .top, spacing: Spacing.sm) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(Theme.accent)
                .frame(width: 32, height: 32)
                .background(Theme.accentWash)
                .clipShape(RoundedRectangle(cornerRadius: 6))

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.textPrimary)

                Text(subtitle)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Theme.accent)

                Text(detail)
                    .font(.caption)
                    .foregroundStyle(Theme.textSecondary)
                    .lineSpacing(2)
                    .padding(.top, 2)
            }
        }
        .industrialCard()
    }
}
