import SwiftUI

struct LaunchView: View {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false

    var body: some View {
        if hasSeenOnboarding {
            TabView {
                TreeView()
                    .tabItem {
                        Label("Tree", systemImage: "tree.fill")
                    }
                BenefitsView()
                    .tabItem {
                        Label("Why water?", systemImage: "drop.fill")
                    }
                AchievementsView()
                    .tabItem {
                        Label("Rewards", systemImage: "sparkles")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }
        } else {
            OnboardingView(showOnboarding: .constant(true))
        }
    }
}

#Preview {
    LaunchView()
} 