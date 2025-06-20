//
//  Untitled.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel = OnboardingViewModel()
    @Binding var showOnboarding: Bool
    @State private var dailyGoal: Double = 2000

    var body: some View {
        TabView(selection: $viewModel.currentPage) {
            ForEach(Array(viewModel.pages.enumerated()), id: \.offset) { idx, page in
                VStack(spacing: 32) {
                    Text(page.emoji).font(.system(size: 80))
                    Text(page.title).font(.largeTitle).bold()
                    Text(page.message).font(.title2).multilineTextAlignment(.center)
                    if idx == 2 {
                        VStack {
                            Text("Daily Goal: \(Int(dailyGoal)) ml")
                            Slider(value: $dailyGoal, in: 1000...4000, step: 100)
                        }
                        .padding()
                    }
                    if idx == viewModel.pages.count - 1 {
                        Button("Start!") {
                            let settings = UserDefaultsManager.shared.loadSettings()
                            var newSettings = settings
                            newSettings.dailyGoal = Int(dailyGoal)
                            UserDefaultsManager.shared.saveSettings(newSettings)
                            showOnboarding = false
                            UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
                        }
                        .padding()
                        .background(Capsule().fill(Color.green.opacity(0.2)))
                    } else {
                        Text("Swipe to continue...->")
                    }
                }
                .tag(idx)
                .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

