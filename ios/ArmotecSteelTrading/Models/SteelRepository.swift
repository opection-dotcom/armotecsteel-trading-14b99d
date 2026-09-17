import Foundation

enum SteelRepository {
    static let products: [SteelProduct] = [
        // --- LONG PRODUCTS ---
        SteelProduct(
            id: "LP-01",
            name: "Hot Rolled H Beams",
            category: .long,
            subcategory: "Structural Beams",
            steelGrades: ["S235JR", "S275JR", "S355J2+AR", "S355K2"],
            standard: "EN 10034 / EN 10025-2",
            dimensions: "HEA / HEB / HEM 100 to 1000 mm, length 6m–18m",
            applications: ["Heavy Industrial Frames", "Bridge Infrastructure", "OEM Cranes"],
            bufferStockAvailable: true,
            origin: "Leading European & Turkish Mills",
            description: "High load-bearing hot rolled wide-flange structural H sections engineered for heavy structural fabrication.",
            icon: "square.split.diagonal.2x2"
        ),
        SteelProduct(
            id: "LP-02",
            name: "IPE Beams",
            category: .long,
            subcategory: "Structural Beams",
            steelGrades: ["S275JR", "S355J2", "S355J2+AR"],
            standard: "EN 10025 / EN 10034",
            dimensions: "IPE 80 to IPE 600 mm, standard 12m & custom cuts",
            applications: ["Trailer Chassis", "Industrial Building Columns", "Overhead Conveyors"],
            bufferStockAvailable: true,
            origin: "Leading Turkish & European Mills",
            description: "European parallel flange I-beams optimized for high strength-to-weight structural engineering and chassis manufacturing.",
            icon: "line.3.horizontal.circle"
        ),
        SteelProduct(
            id: "LP-03",
            name: "C & U Channel Beams",
            category: .long,
            subcategory: "Structural Channels",
            steelGrades: ["S235JR", "S275J2", "S355J2"],
            standard: "EN 10279 / DIN 1026",
            dimensions: "UPN / UPE 80 to 400 mm",
            applications: ["Machinery Frameworks", "Vehicle Subframes", "Architectural Supports"],
            bufferStockAvailable: true,
            origin: "Certified European Mills",
            description: "Hot rolled taper and parallel flange U/C channels engineered for structural rigidity and mounting rails.",
            icon: "rectangle.portrait.split.2x1"
        ),
        SteelProduct(
            id: "LP-04",
            name: "Hot Rolled Flat Bars & Crane Rails",
            category: .long,
            subcategory: "Bars & Rails",
            steelGrades: ["S355J2+AR", "S275JR", "C45E", "42CrMo4"],
            standard: "EN 10058 / EN 10025",
            dimensions: "Width 20–300 mm, Thickness 5–60 mm",
            applications: ["Bridge Crane Runway Rails", "Mechanical Guides", "Mounting Flanges"],
            bufferStockAvailable: true,
            origin: "European Precision Rolling Mills",
            description: "Solid high-tensile flat steel bars with tight dimensional tolerance for crane runways and machinery guides.",
            icon: "rectangle.compress.vertical"
        ),
        SteelProduct(
            id: "LP-05",
            name: "Cold Deformed SHS & RHS Sections",
            category: .long,
            subcategory: "Hollow Sections",
            steelGrades: ["S235JRH", "S275J0H", "S355J2H"],
            standard: "EN 10219-1/2",
            dimensions: "20x20 mm to 400x400 mm, Wall 2.0 to 16.0 mm",
            applications: ["Industrial Plant Construction", "Agricultural Machinery", "Offshore Platforms"],
            bufferStockAvailable: true,
            origin: "Turkish & European Mills",
            description: "Cold formed welded structural hollow sections with certified impact toughness at -20°C.",
            icon: "square.dashed"
        ),
        SteelProduct(
            id: "LP-06",
            name: "Precision Steel Tubes",
            category: .long,
            subcategory: "Tubes & Pipes",
            steelGrades: ["E235", "E355", "E260"],
            standard: "EN 10305-1 / EN 10305-2 (DOM)",
            dimensions: "OD 6 to 120 mm, Wall 0.5 to 10.0 mm",
            applications: ["Hydraulic Cylinders", "Automotive Axles", "Pneumatic Systems"],
            bufferStockAvailable: false,
            origin: "European Special Tube Mills",
            description: "Seamless and welded cold drawn precision tubes for hydraulic and automotive precision systems.",
            icon: "circle.circle"
        ),
        SteelProduct(
            id: "LP-07",
            name: "Cold Deformed C, Z & U Profiles",
            category: .long,
            subcategory: "Special Profiles",
            steelGrades: ["S280GD", "S350GD+Z", "S355MC"],
            standard: "EN 10162 / EN 10346",
            dimensions: "Web 100–350 mm, Flange 40–100 mm, Thickness 1.5–4.0 mm",
            applications: ["Solar Mounting Systems", "Light Steel Framing", "Purlins & Girts"],
            bufferStockAvailable: true,
            origin: "Free-zone Gebze Stock",
            description: "Custom rolled lightweight structural profiles with continuous galvanizing for corrosion resistance.",
            icon: "chevron.left.forwardslash.chevron.right"
        ),
        SteelProduct(
            id: "LP-08",
            name: "Round & Special Engineering Bars",
            category: .long,
            subcategory: "Engineered Bars",
            steelGrades: ["S355J2", "42CrMo4+QT", "16MnCr5", "C45"],
            standard: "EN 10060 / EN 10083",
            dimensions: "Diameter 12 to 350 mm",
            applications: ["Shafts", "Gears", "Hydraulic Rods", "Bolting & Fasteners"],
            bufferStockAvailable: true,
            origin: "European Quality Forges & Mills",
            description: "Alloyed and non-alloyed round engineering bars for precision machining and heat treatment.",
            icon: "circle.grid.cross.fill"
        ),

        // --- FLAT PRODUCTS ---
        SteelProduct(
            id: "FP-01",
            name: "Hot Rolled High-Strength Sheets & Plates",
            category: .flat,
            subcategory: "High Strength Steel",
            steelGrades: ["S355MC", "S420MC", "S500MC", "S700MC"],
            standard: "EN 10149-2",
            dimensions: "Thickness 2.0 to 20 mm, Width up to 2000 mm",
            applications: ["Chassis Components", "Telescopic Booms", "Heavy Transport Trailers"],
            bufferStockAvailable: true,
            origin: "Top European Mills",
            description: "Thermo-mechanically rolled fine-grain steel sheets offering exceptional cold formability and high yield strength.",
            icon: "square.fill.text.grid.1x2"
        ),
        SteelProduct(
            id: "FP-02",
            name: "Wear-Resistant Heavy Steel Plates",
            category: .flat,
            subcategory: "Wear Resistant Plates",
            steelGrades: ["AR 400", "AR 450", "AR 500", "S690QL"],
            standard: "EN 10025-6 / Mill Specs",
            dimensions: "Thickness 4.0 to 80 mm, Plates up to 2500x8000 mm",
            applications: ["Mining Buckets", "Concrete Mixers", "Chutes & Crushers", "Dump Trucks"],
            bufferStockAvailable: true,
            origin: "Certified European Heavy Plate Mills",
            description: "Quenched and tempered abrasion-resistant steel plates engineered for extreme abrasive environments.",
            icon: "shield.checkered"
        ),
        SteelProduct(
            id: "FP-03",
            name: "Cold Rolled Galvanized & ZnMg Coated Sheets",
            category: .flat,
            subcategory: "Coated Sheets & Coils",
            steelGrades: ["DX51D+ZM", "S280GD+95ZM", "S320GD+Z", "S350GD+ZM"],
            standard: "EN 10346",
            dimensions: "Thickness 0.5 to 3.0 mm, Width 1000 / 1250 / 1500 mm",
            applications: ["Solar Trackers", "Automotive Panels", "Air Duct Systems", "Agricultural Equipment"],
            bufferStockAvailable: true,
            origin: "Leading Turkish & European Mills",
            description: "Zinc-Magnesium (ZnMg) and Hot-Dip Galvanized coils delivering 3x superior corrosion resistance compared to standard zinc coatings.",
            icon: "circle.hexagongrid.fill"
        ),
        SteelProduct(
            id: "FP-04",
            name: "Prepainted Steel Sheets & Coils",
            category: .flat,
            subcategory: "Coated Sheets & Coils",
            steelGrades: ["S280GD+95ZM Pre-painted", "DX51D+Z Organic Coated"],
            standard: "EN 10169",
            dimensions: "Thickness 0.4 to 1.5 mm, RAL color series",
            applications: ["Commercial Trailer Exterior Walls", "Architectural Facades", "Insulated Sandwich Panels"],
            bufferStockAvailable: true,
            origin: "Gebze Free-Zone Buffer Stock",
            description: "Coil-coated prepainted steel with UV and scratch resistant multi-layer paint systems for exterior OEM body manufacturing.",
            icon: "paintpalette.fill"
        ),
        SteelProduct(
            id: "FP-05",
            name: "Plasma & Laser-Cut Steel Strips & Flats",
            category: .flat,
            subcategory: "Processed Strips & Flats",
            steelGrades: ["S235JR", "S355J2+N", "S355MC"],
            standard: "EN ISO 9013 Class 1/2",
            dimensions: "Custom widths from 50 mm to 800 mm, thickness 3 to 25 mm",
            applications: ["OEM Subassemblies", "Flange Rings", "Weldments", "Machine Bases"],
            bufferStockAvailable: true,
            origin: "Armotec Processing Network",
            description: "Deburred, decambered, and laser/plasma slit strips ready for direct automated robotic welding and assembly.",
            icon: "scissors"
        ),

        // --- COMPOSITE / PLASTIC PRODUCTS ---
        SteelProduct(
            id: "CP-01",
            name: "GRP High-Impact Composite Panels",
            category: .composite,
            subcategory: "Composite Panels",
            steelGrades: ["Woven Roving GRP / Polyurethane Core"],
            standard: "ISO 9001 / EN 45545",
            dimensions: "Continuous lengths up to 13.6 m, Width up to 3.0 m, Thickness 1.2–30 mm",
            applications: [
                "Refrigerator Trailer Floors",
                "Exterior Box Body Walls",
                "Interior Cleanroom Walls",
                "Commercial Vehicle Lining"
            ],
            bufferStockAvailable: true,
            origin: "Specialist Composite Facilities",
            description: "Glass-fiber-reinforced plastic (GRP) continuous sheets with gel-coat surfaces, offering zero corrosion, lightweight thermal insulation, and extreme impact resistance for refrigerated logistics.",
            icon: "square.3.layers.3d.down.right"
        )
    ]

    static let challengesAndSolutions: [SupplyChainChallengeSolution] = [
        SupplyChainChallengeSolution(
            id: 1,
            challengeTitle: "Long Lead Times",
            challengeDetail: "Production and delivery of special steel products often require extended lead times from rolling mills, slowing critical OEM manufacturing schedules.",
            solutionTitle: "Fast Delivery from Free-Zone Buffer Stock",
            solutionDetail: "Most demanded special steel products are held in buffer stock in our free economic zone warehouse at Gebze Port, ready for rapid dispatch.",
            metricBadge: "7-Day Avg Dispatch",
            icon: "clock.badge.checkmark.fill"
        ),
        SupplyChainChallengeSolution(
            id: 2,
            challengeTitle: "Excessive Minimum Order Quantities (MOQ)",
            challengeDetail: "Many international steel mills offer special grades only in large 25–50 ton batch commitments, making procurement inefficient for variable OEM demand.",
            solutionTitle: "Flexible Small Batches",
            solutionDetail: "Customers can purchase small, tailored quantities and mixed product profiles without committing to full mill heats or large production runs.",
            metricBadge: "No Rigid Mill MOQ",
            icon: "shippingbox.and.arrow.backward.fill"
        ),
        SupplyChainChallengeSolution(
            id: 3,
            challengeTitle: "Unstable Production Output & Scrapping",
            challengeDetail: "Under-rolling and re-rolling at primary mills frequently lead to delivered quantity shortfalls, quality deviations, and costly downtime.",
            solutionTitle: "Fixed Quantities & Predictable Timing",
            solutionDetail: "Stocked products are inspected, certified, and delivered according to pre-agreed quantities, verified dimensions, and reliable schedules.",
            metricBadge: "100% Quantity Assurance",
            icon: "checkmark.seal.fill"
        ),
        SupplyChainChallengeSolution(
            id: 4,
            challengeTitle: "Logistics & Disruption Risks",
            challengeDetail: "Geopolitical conflicts, shipping corridor bottlenecks, port congestion, and route disruptions can cause devastating supply-chain halts.",
            solutionTitle: "Strategic Buffer Stock & Risk Mitigation",
            solutionDetail: "Armotec holds contracted inventory in advance at the crossroads of Europe and Asia, neutralizing shipping volatility.",
            metricBadge: "Multi-modal Resilience",
            icon: "network"
        ),
        SupplyChainChallengeSolution(
            id: 5,
            challengeTitle: "Customs & Regulatory Complexity",
            challengeDetail: "Cross-border deliveries require complex customs clearance, EUR.1 / ATR documentation, and rigorous international tax handling.",
            solutionTitle: "Full Customs Clearance Management",
            solutionDetail: "Armotec's experienced operations team handles all import/export clearance, transit declarations, and certification paperwork seamlessly.",
            metricBadge: "Turnkey Transit",
            icon: "doc.badge.shield"
        ),
        SupplyChainChallengeSolution(
            id: 6,
            challengeTitle: "Working Capital & Inventory Carrying Costs",
            challengeDetail: "Purchasing imported steel batches ties up massive working capital, generates storage expenses, and imposes heavy balance-sheet drag.",
            solutionTitle: "Capital-Preserving Working Capital Solution",
            solutionDetail: "Armotec invests its own capital into holding tailored buffer stock, allowing OEMs to pay as they consume and preserve liquid capital.",
            metricBadge: "Capital Efficiency",
            icon: "banknote.fill"
        )
    ]

    static let supplyChainSteps: [SupplyChainStep] = [
        SupplyChainStep(
            id: 1,
            stepNumber: "01",
            title: "Procurement from Certified Mills",
            detail: "Engineering steel and raw materials are sourced directly from premier certified rolling mills across Europe and Turkey with full EN 10204 3.1 certification.",
            hubLocation: "Europe & Turkey Rolling Mills",
            iconName: "building.2.crop.between.columns.fill",
            highlight: "Direct Mill Contracts"
        ),
        SupplyChainStep(
            id: 2,
            stepNumber: "02",
            title: "Customs & Documentation Management",
            detail: "Armotec executes all customs formalities, origin verification, standard conformity checks, and bonded transit paperwork.",
            hubLocation: "Customs Clearances",
            iconName: "doc.text.magnifyingglass",
            highlight: "Fully Bonded Transit"
        ),
        SupplyChainStep(
            id: 3,
            stepNumber: "03",
            title: "Gebze Port Free-Zone Buffer Stock",
            detail: "Materials are held in our strategically situated free economic zone warehouse at Gebze Port, Istanbul, avoiding early tax and tariff outlays.",
            hubLocation: "Gebze Port Hub, Istanbul",
            iconName: "building.columns.circle.fill",
            highlight: "Free Economic Zone"
        ),
        SupplyChainStep(
            id: 4,
            stepNumber: "04",
            title: "Just-In-Time Dedicated Delivery",
            detail: "Pre-scheduled or on-demand dispatches are trucked directly to OEM production lines across Turkey, MENA, and Europe.",
            hubLocation: "Direct Factory Gates",
            iconName: "truck.box.badge.clock.fill",
            highlight: "Predictable JIT Schedules"
        ),
        SupplyChainStep(
            id: 5,
            stepNumber: "05",
            title: "Trade Finance & Cargo Insurance",
            detail: "Flexible trade finance, open account terms upon underwriting, and comprehensive marine/transit cargo insurance upon request.",
            hubLocation: "Global Risk Underwriting",
            iconName: "shield.lefthalf.filled.badge.checkmark",
            highlight: "Risk Insured"
        )
    ]

    static let caseStudies: [CaseStudy] = [
        CaseStudy(
            id: "CS-01",
            projectTitle: "Commercial Refrigerator Trailer Manufacturer",
            clientSector: "Heavy Automotive & Transport Equipment",
            location: "Turkey",
            productsSupplied: [
                "IPE 220 Structural Beams (S355J2+AR)",
                "Cold Rolled Galvanized Prepainted Steel S280GD+95ZM Coils",
                "GRP High-Impact Composite Panels"
            ],
            applications: [
                "Heavy-duty semi-trailer main chassis rails",
                "Refrigerated box body exterior insulated sidewalls",
                "Floor structural under-supports"
            ],
            challenge: "The manufacturer faced unpredictable 10–14 week lead times from traditional European mills, erratic coil deliveries with paint surface imperfections, and severe chassis assembly line stoppages.",
            solution: "Armotec established a dedicated buffer stock program in the Gebze Port Free Economic Zone, reserving 3 months of rolled IPE220 beams and color-matched S280GD+95ZM coils for weekly call-offs.",
            measurableResults: [
                "Zero production downtime across 18 consecutive months",
                "Average delivery turnaround reduced to 7 calendar days",
                "Eliminated manufacturer's high warehouse holding overhead",
                "Consistent EN 10204 3.1 material traceability"
            ],
            leadTimeStat: "7-Day Delivery",
            icon: "box.truck.fill"
        ),
        CaseStudy(
            id: "CS-02",
            projectTitle: "Industrial Bridge Crane Manufacturer",
            clientSector: "Heavy Lifting & Material Handling Equipment",
            location: "Turkey",
            productsSupplied: [
                "Crane Rail Flat Bar Special Sections",
                "S355J2+AR High-Tensile Structural Steel",
                "Heavy Steel Plates (S355K2+N)"
            ],
            applications: [
                "Overhead bridge crane runway rails",
                "End-carriage structural support flanges",
                "Trolley track assemblies"
            ],
            challenge: "High minimum rolling lot sizes forced the OEM to over-purchase rail profiles in bulk, locking over $350k in idle working capital, while mill dimensional variations caused excessive machining labor.",
            solution: "Armotec supplied pre-straightened, tightly toleranced S355J2+AR flat bar crane rails in exact customer batch sizes directly from the Gebze logistics hub.",
            measurableResults: [
                "Reported 15% reduction in total material-related procurement costs",
                "22% faster bridge crane manufacturing and assembly cycle",
                "Zero working capital lockup for unneeded surplus steel inventory",
                "Guaranteed mill test certificates EN 10204 included with each batch"
            ],
            leadTimeStat: "-15% Costs",
            icon: "cable.car.fill"
        )
    ]
}
