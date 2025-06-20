//
//  Untitled.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import Foundation

class AchievementsViewModel: ObservableObject {
    @Published var achievements: [Achievement]

    init() {
        // Default achievements
        let defaults: [Achievement] = [
            Achievement(id: "first_drop", title: "First Drop", description: "Drink your first water!", emoji: "💧", isUnlocked: false),
            Achievement(id: "daily_stream", title: "Daily Stream", description: "Reach your daily goal!", emoji: "🌊", isUnlocked: false),
            Achievement(id: "seven_day_bloom", title: "7-Day Bloom", description: "Reach your goal 7 days in a row!", emoji: "🌸", isUnlocked: false)
        ]
        let saved = UserDefaultsManager.shared.loadAchievements()
        if saved.isEmpty {
            self.achievements = defaults
            UserDefaultsManager.shared.saveAchievements(defaults)
        } else {
            self.achievements = saved
        }
    }

    func unlock(_ id: String) {
        if let idx = achievements.firstIndex(where: { $0.id == id }) {
            achievements[idx].isUnlocked = true
            UserDefaultsManager.shared.saveAchievements(achievements)
        }
    }
}
