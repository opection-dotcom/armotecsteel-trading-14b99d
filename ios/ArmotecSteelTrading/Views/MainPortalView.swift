import SwiftUI

enum AppTab: Int, CaseIterable, Identifiable {
    case showcase = 0
    case products = 1
    case quote = 2
    case logistics = 3
    case caseStudies = 4
    case about = 5

    var id: Int { rawValue }

    var title: String {
        switch self {
        case .showcase: return "Overview"
        case .products: return "Products"
        case .quote: return "Quote"
        case .logistics: return "Logistics"
        case .caseStudies: return "Cases"
        case .about: return "About"
        }
    }

    var icon: String {
        switch self {
        case .showcase: return "sparkles.rectangle.stack.fill"
        case .products: return "square.grid.2x2.fill"
        case .quote: return "doc.text.fill"
        case .logistics: return "network"
        case .caseStudies: return "shield.checkered"
        case .about: return "building.2.crop.circle"
        }
    }
}

struct MainPortalView: View {
    @State private var selectedTab: AppTab = .showcase
    @State private var quotationDraft = QuotationDraft()

    var body: some View {
        TabView(selection: $selectedTab) {
            // Tab 1: Discover & Executive Showcase
            ShowcaseHomeView(
                onRequestQuote: {
                    selectedTab = .quote
                },
                onExploreProducts: {
                    selectedTab = .products
                }
            )
            .tabItem {
                Label("Overview", systemImage: "sparkles.rectangle.stack.fill")
            }
            .tag(AppTab.showcase)

            // Tab 2: Products Catalog & Search
            ProductCatalogView(
                onRequestQuoteForProduct: { product in
                    quotationDraft.productType = product.name
                    quotationDraft.steelGrade = product.steelGrades.first ?? ""
                    quotationDraft.dimensions = product.dimensions
                    selectedTab = .quote
                }
            )
            .tabItem {
                Label("Products", systemImage: "square.grid.2x2.fill")
            }
            .tag(AppTab.products)

            // Tab 3: Request Quote / RFQ Form
            RequestQuoteView(draft: $quotationDraft)
                .tabItem {
                    Label("Quote", systemImage: "doc.text.fill")
                }
                .tag(AppTab.quote)

            // Tab 4: Logistics & Hubs
            LogisticsSupplyHubView(
                onRequestQuote: {
                    selectedTab = .quote
                }
            )
            .tabItem {
                Label("Logistics", systemImage: "network")
            }
            .tag(AppTab.logistics)

            // Tab 5: Case Studies & Quality
            CaseStudiesView(
                onRequestQuote: {
                    selectedTab = .quote
                }
            )
            .tabItem {
                Label("Case Studies", systemImage: "shield.checkered")
            }
            .tag(AppTab.caseStudies)

            // Tab 6: About & Contact
            AboutCompanyContactView(
                onRequestQuote: {
                    selectedTab = .quote
                }
            )
            .tabItem {
                Label("About", systemImage: "building.2.crop.circle")
            }
            .tag(AppTab.about)
        }
        .tint(Theme.accent)
    }
}

// MARK: - Showcase Home View (Tab 1)
struct ShowcaseHomeView: View {
    let onRequestQuote: () -> Void
    let onExploreProducts: () -> Void

    var body: some View {
        NavigationStack {
            ZStack {
                SteelBackgroundView()

                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.lg) {
                        // 1. Hero Showcase Section
                        HeroShowcaseSection(
                            onRequestQuote: onRequestQuote,
                            onExploreProducts: onExploreProducts
                        )

                        // 2. Client Challenges & Armotec Solutions
                        ClientChallengesSolutionsView(onRequestQuote: onRequestQuote)

                        // 3. How It Works 5-Step Supply Chain Timeline
                        SupplyChainTimelineView()

                        // 4. Quality & Compliance Trust Module
                        QualityCertificatesSection()

                        // 5. Final Strong CTA Section
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("Let's check if our offer meets your requirements")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(Theme.textPrimary)

                            Text("Tell us which materials or steel grades you are interested in, and our team will get back to you with availability, delivery options and technical details.")
                                .font(.caption)
                                .foregroundStyle(Theme.textSecondary)

                            PrimaryIndustrialButton(
                                title: "Request a Quote",
                                icon: "doc.text.badge.plus"
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
            .navigationTitle("Armotec Steel Trading")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        onRequestQuote()
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "plus.circle.fill")
                            Text("Quote")
                                .fontWeight(.bold)
                        }
                        .font(.caption)
                        .foregroundStyle(Theme.accent)
                    }
                }
            }
        }
    }
}
