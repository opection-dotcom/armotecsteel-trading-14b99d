import SwiftUI

struct ProductCatalogView: View {
    @State private var selectedCategory: ProductCategory = .all
    @State private var searchText: String = ""
    @State private var selectedSteelGrade: String = "All Grades"
    @State private var selectedProductForDetail: SteelProduct? = nil
    @State private var showBufferStockOnly: Bool = false

    let onRequestQuoteForProduct: (SteelProduct) -> Void

    var allProducts: [SteelProduct] {
        SteelRepository.products
    }

    var availableGrades: [String] {
        var grades = Set<String>()
        for p in allProducts {
            for g in p.steelGrades {
                grades.insert(g)
            }
        }
        return ["All Grades"] + Array(grades).sorted()
    }

    var filteredProducts: [SteelProduct] {
        allProducts.filter { product in
            let matchesCategory = (selectedCategory == .all) || (product.category == selectedCategory)
            let matchesBuffer = !showBufferStockOnly || product.bufferStockAvailable
            let matchesGrade = (selectedSteelGrade == "All Grades") || product.steelGrades.contains(selectedSteelGrade)

            let matchesSearch = searchText.isEmpty ||
                product.name.localizedCaseInsensitiveContains(searchText) ||
                product.subcategory.localizedCaseInsensitiveContains(searchText) ||
                product.standard.localizedCaseInsensitiveContains(searchText) ||
                product.steelGrades.joined(separator: " ").localizedCaseInsensitiveContains(searchText) ||
                product.applications.joined(separator: " ").localizedCaseInsensitiveContains(searchText)

            return matchesCategory && matchesBuffer && matchesGrade && matchesSearch
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                SteelBackgroundView()

                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.md) {
                        // Section Banner
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("PRODUCT SPECIFICATIONS")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .tracking(1.2)
                                    .foregroundStyle(Theme.accent)
                                Spacer()
                                Text("\(filteredProducts.count) Items")
                                    .font(.caption2)
                                    .foregroundStyle(Theme.textMuted)
                            }

                            Text("Engineering Steel & Composite Catalog")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(Theme.textPrimary)

                            Text("Filter by grade, dimensions, or application. Request instant availability directly from Gebze Port buffer stock.")
                                .font(.footnote)
                                .foregroundStyle(Theme.textSecondary)
                        }
                        .padding(.horizontal, Spacing.screenMargin)
                        .padding(.top, Spacing.sm)

                        // Search Bar
                        HStack(spacing: Spacing.xs) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(Theme.accent)
                            TextField("Search grades, beams, coils, GRP panels...", text: $searchText)
                                .foregroundStyle(Theme.textPrimary)
                                .autocorrectionDisabled()

                            if !searchText.isEmpty {
                                Button {
                                    searchText = ""
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(Theme.textMuted)
                                }
                            }
                        }
                        .padding(Spacing.sm)
                        .background(Theme.surfaceRaised)
                        .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
                        .overlay(
                            RoundedRectangle(cornerRadius: Radius.sm)
                                .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
                        )
                        .padding(.horizontal, Spacing.screenMargin)

                        // Category Chips
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(ProductCategory.allCases) { category in
                                    Button {
                                        withAnimation(.easeInOut(duration: 0.15)) {
                                            selectedCategory = category
                                        }
                                    } label: {
                                        HStack(spacing: 6) {
                                            Image(systemName: category.iconName)
                                                .font(.caption2)
                                            Text(category.rawValue)
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                        }
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .background(selectedCategory == category ? Theme.accent : Theme.surface)
                                        .foregroundStyle(selectedCategory == category ? Theme.onAccent : Theme.steelLight)
                                        .clipShape(Capsule())
                                        .overlay(
                                            Capsule()
                                                .strokeBorder(selectedCategory == category ? Color.clear : Theme.surfaceBorder, lineWidth: 1)
                                        )
                                    }
                                }
                            }
                            .padding(.horizontal, Spacing.screenMargin)
                        }

                        // Filter Row: Steel Grade & Buffer Stock Toggle
                        HStack(spacing: Spacing.sm) {
                            // Grade Picker
                            Menu {
                                ForEach(availableGrades, id: \.self) { grade in
                                    Button(grade) {
                                        selectedSteelGrade = grade
                                    }
                                }
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: "slider.horizontal.3")
                                        .font(.caption2)
                                    Text(selectedSteelGrade)
                                        .font(.caption)
                                        .fontWeight(.medium)
                                    Image(systemName: "chevron.down")
                                        .font(.caption2)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(Theme.surface)
                                .foregroundStyle(selectedSteelGrade != "All Grades" ? Theme.accent : Theme.steelLight)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
                                )
                            }

                            // Buffer Stock Toggle Button
                            Button {
                                showBufferStockOnly.toggle()
                            } label: {
                                HStack(spacing: 4) {
                                    Image(systemName: showBufferStockOnly ? "checkmark.circle.fill" : "circle")
                                        .font(.caption2)
                                        .foregroundStyle(showBufferStockOnly ? Theme.accent : Theme.textMuted)
                                    Text("Buffer Stock Only")
                                        .font(.caption)
                                        .fontWeight(.medium)
                                        .foregroundStyle(showBufferStockOnly ? Theme.accent : Theme.textSecondary)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(showBufferStockOnly ? Theme.accentWash : Theme.surface)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .strokeBorder(showBufferStockOnly ? Theme.accent.opacity(0.4) : Theme.surfaceBorder, lineWidth: 1)
                                )
                            }

                            Spacer()
                        }
                        .padding(.horizontal, Spacing.screenMargin)

                        // Product Cards List
                        if filteredProducts.isEmpty {
                            VStack(spacing: Spacing.sm) {
                                Image(systemName: "magnifyingglass")
                                    .font(.system(size: 40))
                                    .foregroundStyle(Theme.textMuted)
                                Text("No materials match your filter")
                                    .font(.headline)
                                    .foregroundStyle(Theme.textPrimary)
                                Text("Contact Armotec for custom specifications, tailored rolling programs, and special alloys.")
                                    .font(.caption)
                                    .foregroundStyle(Theme.textSecondary)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(Spacing.xl)
                            .frame(maxWidth: .infinity)
                            .background(Theme.surface)
                            .clipShape(RoundedRectangle(cornerRadius: Radius.md))
                            .padding(.horizontal, Spacing.screenMargin)
                        } else {
                            LazyVStack(spacing: Spacing.sm) {
                                ForEach(filteredProducts) { product in
                                    ProductCardView(
                                        product: product,
                                        onSelect: {
                                            selectedProductForDetail = product
                                        },
                                        onRequestAvailability: {
                                            onRequestQuoteForProduct(product)
                                        }
                                    )
                                }
                            }
                            .padding(.horizontal, Spacing.screenMargin)
                        }

                        Spacer(minLength: Spacing.huge)
                    }
                }
            }
            .navigationTitle("Products & Stock")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $selectedProductForDetail) { product in
                ProductDetailSheet(product: product) {
                    selectedProductForDetail = nil
                    onRequestQuoteForProduct(product)
                }
            }
        }
    }
}

// MARK: - Product Card View
struct ProductCardView: View {
    let product: SteelProduct
    let onSelect: () -> Void
    let onRequestAvailability: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            // Top Meta
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(product.subcategory.uppercased())
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundStyle(Theme.accent)

                    Text(product.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(Theme.textPrimary)
                }

                Spacer()

                if product.bufferStockAvailable {
                    TechnicalBadge(text: "Gebze Stock", isAccent: true)
                } else {
                    TechnicalBadge(text: "Mill Sourced", isAccent: false)
                }
            }

            // Specs Quick Grid
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .top) {
                    Text("Standard:")
                        .font(.caption2)
                        .foregroundStyle(Theme.textMuted)
                        .frame(width: 70, alignment: .leading)
                    Text(product.standard)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(Theme.steelLight)
                }

                HStack(alignment: .top) {
                    Text("Grades:")
                        .font(.caption2)
                        .foregroundStyle(Theme.textMuted)
                        .frame(width: 70, alignment: .leading)
                    Text(product.steelGrades.joined(separator: " • "))
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(Theme.textSecondary)
                        .lineLimit(2)
                }

                HStack(alignment: .top) {
                    Text("Dimensions:")
                        .font(.caption2)
                        .foregroundStyle(Theme.textMuted)
                        .frame(width: 70, alignment: .leading)
                    Text(product.dimensions)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(Theme.textSecondary)
                        .lineLimit(1)
                }
            }
            .padding(Spacing.xs)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Theme.surfaceRaised)
            .clipShape(RoundedRectangle(cornerRadius: 6))

            // Action Row
            HStack(spacing: Spacing.xs) {
                Button(action: onSelect) {
                    HStack(spacing: 4) {
                        Image(systemName: "doc.plaintext")
                            .font(.caption)
                        Text("Technical Specs")
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(Theme.steelLight)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Theme.surfaceRaised)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
                    )
                }

                Spacer()

                Button(action: onRequestAvailability) {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.up.right.square.fill")
                            .font(.caption)
                        Text("Request Availability")
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(Theme.onAccent)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Theme.amberGradient)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                }
                .buttonStyle(PressFeedbackStyle())
            }
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

// MARK: - Product Detail Sheet
struct ProductDetailSheet: View {
    let product: SteelProduct
    let onRequestQuote: () -> Void
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                SteelBackgroundView()

                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.md) {
                        // Header Box
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text(product.category.rawValue.uppercased())
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Theme.accent)
                                Spacer()
                                if product.bufferStockAvailable {
                                    TechnicalBadge(text: "Gebze Free-Zone Buffer Stock", isAccent: true)
                                }
                            }

                            Text(product.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(Theme.textPrimary)

                            Text(product.description)
                                .font(.subheadline)
                                .foregroundStyle(Theme.textSecondary)
                                .lineSpacing(2)
                        }
                        .industrialCard(isElevated: true, accentBorder: true)

                        // Specification Parameters
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("TECHNICAL PARAMETERS")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(1.2)
                                .foregroundStyle(Theme.accent)

                            SpecRow(label: "Standard Conformity", value: product.standard)
                            SpecRow(label: "Available Steel Grades", value: product.steelGrades.joined(separator: ", "))
                            SpecRow(label: "Dimensional Envelope", value: product.dimensions)
                            SpecRow(label: "Sourcing & Origin", value: product.origin)
                            SpecRow(label: "Inspection Document", value: "EN 10204 3.1 / 2.2 upon request")
                        }
                        .industrialCard()

                        // Typical Engineering Applications
                        VStack(alignment: .leading, spacing: Spacing.sm) {
                            Text("TARGET OEM APPLICATIONS")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(1.2)
                                .foregroundStyle(Theme.accent)

                            ForEach(product.applications, id: \.self) { app in
                                HStack(spacing: 8) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.caption)
                                        .foregroundStyle(Theme.accent)
                                    Text(app)
                                        .font(.footnote)
                                        .foregroundStyle(Theme.steelLight)
                                    Spacer()
                                }
                            }
                        }
                        .industrialCard()

                        // CTA Button
                        PrimaryIndustrialButton(
                            title: "Request Availability / Quote",
                            icon: "doc.text.fill"
                        ) {
                            onRequestQuote()
                        }
                        .padding(.top, Spacing.sm)

                        Spacer(minLength: Spacing.xxl)
                    }
                    .padding(Spacing.screenMargin)
                }
            }
            .navigationTitle("Material Specification")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundStyle(Theme.accent)
                }
            }
        }
    }
}

struct SpecRow: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(label)
                .font(.caption2)
                .foregroundStyle(Theme.textMuted)
            Text(value)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundStyle(Theme.textPrimary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 2)
    }
}
