//
//  ForestDropApp.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import SwiftUI

@main
struct ForestDropApp: App {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false

    var body: some Scene {
        WindowGroup {
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
}
