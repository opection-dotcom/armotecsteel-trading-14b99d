import SwiftUI

struct RequestQuoteView: View {
    @Binding var draft: QuotationDraft
    @State private var showingFilePickerMock: Bool = false
    @State private var submissionCompleted: Bool = false
    @State private var validationErrorMessage: String? = nil

    let commonProducts = [
        "Hot Rolled H Beams (HEA / HEB / HEM)",
        "IPE Beams (IPE 80–600)",
        "C & U Channel Beams (UPN / UPE)",
        "Hot Rolled Flat Bars & Crane Rails",
        "Cold Deformed SHS & RHS Hollow Sections",
        "Precision Tubes (Seamless / Welded)",
        "Cold Deformed C, Z & U Profiles",
        "Round & Special Engineering Bars",
        "Hot Rolled High-Strength Steel Sheets (S355–S700MC)",
        "Wear-Resistant Steel Plates (AR400/450/500)",
        "Cold Rolled Galvanized & ZnMg Coated Sheets",
        "Prepainted Steel Sheets & Coils",
        "Plasma & Laser-Cut Steel Strips & Flats",
        "GRP High-Impact Composite Panels",
        "Custom Specification / Special Grade"
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                SteelBackgroundView()

                ScrollView {
                    VStack(alignment: .leading, spacing: Spacing.md) {
                        if submissionCompleted {
                            SuccessSubmissionView {
                                draft = QuotationDraft()
                                submissionCompleted = false
                            }
                        } else {
                            // Section Banner
                            VStack(alignment: .leading, spacing: 4) {
                                Text("COMMERCIAL & TECHNICAL INQUIRY")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .tracking(1.2)
                                    .foregroundStyle(Theme.accent)

                                Text("Request a Quotation")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Theme.textPrimary)

                                Text("Submit your required steel grades, dimensions, volumes, and drawings. The Armotec trading desk will verify buffer-stock availability and provide landed pricing.")
                                    .font(.footnote)
                                    .foregroundStyle(Theme.textSecondary)
                            }
                            .padding(.top, Spacing.xs)

                            if let error = validationErrorMessage {
                                HStack(spacing: 6) {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .foregroundStyle(Color.red)
                                    Text(error)
                                        .font(.caption)
                                        .foregroundStyle(Color.red)
                                }
                                .padding(Spacing.xs)
                                .background(Color.red.opacity(0.12))
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                            }

                            // 1. Company & Contact Details
                            VStack(alignment: .leading, spacing: Spacing.sm) {
                                SectionHeaderLabel(title: "1. OEM & Contact Information", icon: "building.2.fill")

                                FormInputField(
                                    label: "Company Name *",
                                    placeholder: "e.g. Atlas Heavy Equipment Manufacturing LLC",
                                    text: $draft.companyName
                                )

                                FormInputField(
                                    label: "Contact Person *",
                                    placeholder: "Full Name & Title (e.g. Chief Procurement Officer)",
                                    text: $draft.contactPerson
                                )

                                HStack(spacing: Spacing.sm) {
                                    FormInputField(
                                        label: "Corporate Email *",
                                        placeholder: "procurement@company.com",
                                        text: $draft.email,
                                        keyboard: .emailAddress
                                    )
                                    FormInputField(
                                        label: "Phone / WhatsApp *",
                                        placeholder: "+971 50 ...",
                                        text: $draft.phone,
                                        keyboard: .phonePad
                                    )
                                }

                                FormInputField(
                                    label: "Country / Operational Region *",
                                    placeholder: "UAE, Turkey, Germany, Saudi Arabia...",
                                    text: $draft.country
                                )
                            }
                            .industrialCard()

                            // 2. Material Specifications
                            VStack(alignment: .leading, spacing: Spacing.sm) {
                                SectionHeaderLabel(title: "2. Technical Material Specifications", icon: "cube.fill")

                                // Product Type Select
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Product Type *")
                                        .font(.caption2)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Theme.steelLight)

                                    Menu {
                                        ForEach(commonProducts, id: \.self) { item in
                                            Button(item) {
                                                draft.productType = item
                                            }
                                        }
                                    } label: {
                                        HStack {
                                            Text(draft.productType.isEmpty ? "Select Product Category / Profile" : draft.productType)
                                                .font(.caption)
                                                .foregroundStyle(draft.productType.isEmpty ? Theme.textMuted : Theme.textPrimary)
                                            Spacer()
                                            Image(systemName: "chevron.down")
                                                .font(.caption2)
                                                .foregroundStyle(Theme.accent)
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

                                HStack(spacing: Spacing.sm) {
                                    FormInputField(
                                        label: "Steel Grade / Standard",
                                        placeholder: "e.g. S355J2+AR, S280GD+95ZM",
                                        text: $draft.steelGrade
                                    )
                                    FormInputField(
                                        label: "Required Dimensions",
                                        placeholder: "e.g. IPE 220, 12m length",
                                        text: $draft.dimensions
                                    )
                                }

                                HStack(spacing: Spacing.sm) {
                                    FormInputField(
                                        label: "Required Quantity",
                                        placeholder: "e.g. 45 Tons, 3 Bundles",
                                        text: $draft.requiredQuantity
                                    )
                                    FormInputField(
                                        label: "Delivery Location",
                                        placeholder: "e.g. Gebze Port / Dubai Port",
                                        text: $draft.deliveryLocation
                                    )
                                }

                                FormInputField(
                                    label: "OEM Project / End Application",
                                    placeholder: "e.g. Refrigerator trailer chassis, overhead bridge crane",
                                    text: $draft.applicationOrProject
                                )
                            }
                            .industrialCard()

                            // 3. Document Attachments
                            VStack(alignment: .leading, spacing: Spacing.sm) {
                                SectionHeaderLabel(title: "3. Technical Document Attachments", icon: "paperclip")

                                Text("Upload technical drawings, BOM Excel spreadsheets, material specifications, or RFQ PDFs.")
                                    .font(.caption2)
                                    .foregroundStyle(Theme.textSecondary)

                                if !draft.attachments.isEmpty {
                                    VStack(spacing: 6) {
                                        ForEach(draft.attachments) { att in
                                            HStack(spacing: 8) {
                                                Image(systemName: att.type.icon)
                                                    .font(.subheadline)
                                                    .foregroundStyle(att.type.color)
                                                VStack(alignment: .leading, spacing: 2) {
                                                    Text(att.filename)
                                                        .font(.caption)
                                                        .fontWeight(.medium)
                                                        .foregroundStyle(Theme.textPrimary)
                                                    Text(att.fileSize)
                                                        .font(.caption2)
                                                        .foregroundStyle(Theme.textMuted)
                                                }
                                                Spacer()
                                                Button {
                                                    draft.attachments.removeAll(where: { $0.id == att.id })
                                                } label: {
                                                    Image(systemName: "trash")
                                                        .font(.caption2)
                                                        .foregroundStyle(Color.red.opacity(0.8))
                                                }
                                            }
                                            .padding(Spacing.xs)
                                            .background(Theme.surfaceRaised)
                                            .clipShape(RoundedRectangle(cornerRadius: 6))
                                        }
                                    }
                                }

                                Button {
                                    showingFilePickerMock = true
                                } label: {
                                    HStack(spacing: 6) {
                                        Image(systemName: "plus.circle.fill")
                                        Text("Attach Technical Document (PDF / DWG / XLSX)")
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                    }
                                    .foregroundStyle(Theme.accent)
                                    .padding(.vertical, 8)
                                    .frame(maxWidth: .infinity)
                                    .background(Theme.accentWash)
                                    .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: Radius.sm)
                                            .strokeBorder(Theme.accent.opacity(0.3), lineWidth: 1)
                                    )
                                }
                            }
                            .industrialCard()

                            // 4. Additional Requirements Notes
                            VStack(alignment: .leading, spacing: Spacing.sm) {
                                SectionHeaderLabel(title: "4. Special Instructions & Tolerances", icon: "pencil.and.list.clipboard")

                                FormInputField(
                                    label: "Additional Requirements",
                                    placeholder: "Specify testing certificates (EN 10204 3.1), packaging, delivery call-offs, or coating tolerances...",
                                    text: $draft.additionalRequirements,
                                    isMultiline: true
                                )
                            }
                            .industrialCard()

                            // Submit CTA
                            PrimaryIndustrialButton(
                                title: "Submit Quotation Request",
                                icon: "paperplane.fill"
                            ) {
                                handleSubmit()
                            }
                            .padding(.top, Spacing.xs)

                            // Contact fallback
                            HStack(spacing: 4) {
                                Image(systemName: "lock.shield.fill")
                                    .font(.caption2)
                                    .foregroundStyle(Theme.accent)
                                Text("Direct trading desk inquiry: ")
                                    .font(.caption2)
                                    .foregroundStyle(Theme.textMuted)
                                Text(CompanyData.email)
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Theme.steelLight)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                        }

                        Spacer(minLength: Spacing.huge)
                    }
                    .padding(Spacing.screenMargin)
                }
            }
            .navigationTitle("Request Quotation")
            .navigationBarTitleDisplayMode(.inline)
            .confirmationDialog("Attach Technical Document", isPresented: $showingFilePickerMock, titleVisibility: .visible) {
                Button("CAD Drawing (.dwg / .dxf)") {
                    draft.attachments.append(TechnicalAttachment(filename: "Chassis_Beam_Section_RevC.dwg", fileSize: "4.2 MB", type: .cadDrawing))
                }
                Button("Material Specification PDF (.pdf)") {
                    draft.attachments.append(TechnicalAttachment(filename: "EN10025_Material_Spec_OEM.pdf", fileSize: "1.8 MB", type: .pdf))
                }
                Button("Bill of Materials (.xlsx)") {
                    draft.attachments.append(TechnicalAttachment(filename: "Armotec_Procurement_BOM_Q3.xlsx", fileSize: "520 KB", type: .excelBOM))
                }
                Button("Cancel", role: .cancel) {}
            }
        }
    }

    private func handleSubmit() {
        if draft.companyName.trimmingCharacters(in: .whitespaces).isEmpty {
            validationErrorMessage = "Please provide your company name."
            return
        }
        if draft.contactPerson.trimmingCharacters(in: .whitespaces).isEmpty {
            validationErrorMessage = "Please provide the contact person."
            return
        }
        if draft.email.trimmingCharacters(in: .whitespaces).isEmpty || !draft.email.contains("@") {
            validationErrorMessage = "Please provide a valid corporate email address."
            return
        }
        if draft.phone.trimmingCharacters(in: .whitespaces).isEmpty {
            validationErrorMessage = "Please provide a contact phone number."
            return
        }
        if draft.productType.trimmingCharacters(in: .whitespaces).isEmpty {
            validationErrorMessage = "Please select or type a product category."
            return
        }

        validationErrorMessage = nil
        withAnimation(.easeInOut) {
            submissionCompleted = true
        }
    }
}

// MARK: - Success Confirmation View
struct SuccessSubmissionView: View {
    let onReset: () -> Void

    var body: some View {
        VStack(spacing: Spacing.md) {
            ZStack {
                Circle()
                    .fill(Theme.accentWash)
                    .frame(width: 72, height: 72)
                Image(systemName: "checkmark.seal.fill")
                    .font(.system(size: 38))
                    .foregroundStyle(Theme.accent)
            }
            .padding(.top, Spacing.md)

            VStack(spacing: 6) {
                Text("Quotation Request Received")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Theme.textPrimary)

                Text("Thank you. Your request has been received. The Armotec team will review your requirements and contact you with availability, pricing and delivery details.")
                    .font(.subheadline)
                    .foregroundStyle(Theme.textSecondary)
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
            }

            VStack(alignment: .leading, spacing: Spacing.xs) {
                HStack {
                    Image(systemName: "clock.badge.checkmark.fill")
                        .foregroundStyle(Theme.accent)
                    Text("Trading Desk SLA: 24-48 Business Hours")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(Theme.textPrimary)
                }
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundStyle(Theme.accent)
                    Text("Gebze Port Free-Zone buffer stock verification active")
                        .font(.caption2)
                        .foregroundStyle(Theme.textMuted)
                }
            }
            .padding(Spacing.sm)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Theme.surfaceRaised)
            .clipShape(RoundedRectangle(cornerRadius: Radius.sm))

            PrimaryIndustrialButton(
                title: "Submit Another Request",
                icon: "plus.circle"
            ) {
                onReset()
            }
            .padding(.top, Spacing.sm)
        }
        .padding(Spacing.md)
        .background(Theme.surface)
        .clipShape(RoundedRectangle(cornerRadius: Radius.lg))
        .overlay(
            RoundedRectangle(cornerRadius: Radius.lg)
                .strokeBorder(Theme.accent.opacity(0.4), lineWidth: 1)
        )
    }
}

// MARK: - Form Helper Views
struct SectionHeaderLabel: View {
    let title: String
    let icon: String

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundStyle(Theme.accent)
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Theme.textPrimary)
        }
    }
}

struct FormInputField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var keyboard: UIKeyboardType = .default
    var isMultiline: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundStyle(Theme.steelLight)

            if isMultiline {
                TextField(placeholder, text: $text, axis: .vertical)
                    .font(.caption)
                    .lineLimit(3...5)
                    .padding(Spacing.sm)
                    .background(Theme.surfaceRaised)
                    .foregroundStyle(Theme.textPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
                    .overlay(
                        RoundedRectangle(cornerRadius: Radius.sm)
                            .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
                    )
            } else {
                TextField(placeholder, text: $text)
                    .font(.caption)
                    .keyboardType(keyboard)
                    .padding(Spacing.sm)
                    .background(Theme.surfaceRaised)
                    .foregroundStyle(Theme.textPrimary)
                    .clipShape(RoundedRectangle(cornerRadius: Radius.sm))
                    .overlay(
                        RoundedRectangle(cornerRadius: Radius.sm)
                            .strokeBorder(Theme.surfaceBorder, lineWidth: 1)
                    )
            }
        }
    }
}
