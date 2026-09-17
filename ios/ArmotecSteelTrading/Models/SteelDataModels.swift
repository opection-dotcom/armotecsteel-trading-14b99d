import SwiftUI

// MARK: - Product Category
enum ProductCategory: String, CaseIterable, Identifiable {
    case all = "All Products"
    case long = "Long Products"
    case flat = "Flat Products"
    case composite = "Composite & GRP"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .all: return "square.grid.2x2.fill"
        case .long: return "rectangle.compress.vertical"
        case .flat: return "square.stack.3d.down.right.fill"
        case .composite: return "shield.lefthalf.filled.trianglebadge.exclamationmark"
        }
    }
}

// MARK: - Product Item
struct SteelProduct: Identifiable, Hashable {
    let id: String
    let name: String
    let category: ProductCategory
    let subcategory: String
    let steelGrades: [String]
    let standard: String
    let dimensions: String
    let applications: [String]
    let bufferStockAvailable: Bool
    let origin: String
    let description: String
    let icon: String
}

// MARK: - Client Challenge & Solution Pair
struct SupplyChainChallengeSolution: Identifiable {
    let id: Int
    let challengeTitle: String
    let challengeDetail: String
    let solutionTitle: String
    let solutionDetail: String
    let metricBadge: String
    let icon: String
}

// MARK: - Supply Chain Timeline Step
struct SupplyChainStep: Identifiable {
    let id: Int
    let stepNumber: String
    let title: String
    let detail: String
    let hubLocation: String
    let iconName: String
    let highlight: String
}

// MARK: - Case Study Model
struct CaseStudy: Identifiable {
    let id: String
    let projectTitle: String
    let clientSector: String
    let location: String
    let productsSupplied: [String]
    let applications: [String]
    let challenge: String
    let solution: String
    let measurableResults: [String]
    let leadTimeStat: String
    let icon: String
}

// MARK: - Quotation Document Attachment
struct TechnicalAttachment: Identifiable, Hashable {
    let id = UUID()
    let filename: String
    let fileSize: String
    let type: AttachmentType

    enum AttachmentType {
        case pdf, cadDrawing, excelBOM, specSheet

        var icon: String {
            switch self {
            case .pdf: return "doc.richtext.fill"
            case .cadDrawing: return "ruler.fill"
            case .excelBOM: return "tablecells.fill"
            case .specSheet: return "doc.text.fill"
            }
        }

        var color: Color {
            switch self {
            case .pdf: return Color.red.opacity(0.8)
            case .cadDrawing: return Color.cyan
            case .excelBOM: return Color.green
            case .specSheet: return Theme.accent
            }
        }
    }
}

// MARK: - Quotation Request Form Model
struct QuotationDraft {
    var companyName: String = ""
    var contactPerson: String = ""
    var email: String = ""
    var phone: String = ""
    var country: String = "United Arab Emirates"
    var productType: String = ""
    var steelGrade: String = ""
    var dimensions: String = ""
    var requiredQuantity: String = ""
    var requiredDeliveryDate: Date = Calendar.current.date(byAdding: .day, value: 14, to: Date()) ?? Date()
    var deliveryLocation: String = ""
    var applicationOrProject: String = ""
    var additionalRequirements: String = ""
    var attachments: [TechnicalAttachment] = []

    var isValid: Bool {
        !companyName.trimmingCharacters(in: .whitespaces).isEmpty &&
        !contactPerson.trimmingCharacters(in: .whitespaces).isEmpty &&
        !email.trimmingCharacters(in: .whitespaces).isEmpty &&
        !phone.trimmingCharacters(in: .whitespaces).isEmpty &&
        !productType.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

// MARK: - Company Static Data
enum CompanyData {
    static let name = "Armotec Steel Trading FZCO"
    static let founded = "2024"
    static let headOffice = "Office № D76, D Wing, 4th Floor, Dubai Silicon Oasis Headquarters Building, Dubai, UAE"
    static let affiliateOffice = "Maltepe, Istanbul, Turkey"
    static let warehouseHub = "Free Economic Zone Warehouse at Gebze Port, Istanbul"
    static let markets = "Turkey, MENA, European Union, and other international markets"
    static let phone = "+971 58 552 77 37"
    static let phoneClean = "+971585527737"
    static let email = "info@armotecsteel.com"
    static let licenseNo = "48866"
    static let corporateTaxNo = "104666029400001"
    static let annualVolume = "6,000+ Tons"
    static let steelExperience = "20+ Years"
    static let supplyExperience = "9+ Years"
    static let regions = "Turkey • MENA • Europe"
}
