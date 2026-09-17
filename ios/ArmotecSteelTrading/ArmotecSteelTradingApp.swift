import SwiftUI

@main
struct ArmotecSteelTradingApp: App {
    init() {
        // Configure dark titanium tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 0.09, green: 0.11, blue: 0.14, alpha: 1.0)

        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }

    var body: some Scene {
        WindowGroup {
            MainPortalView()
                .preferredColorScheme(.dark)
        }
    }
}
