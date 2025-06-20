//
//  Untitled.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let progressKey = "waterProgress"
    private let settingsKey = "settings"
    private let achievementsKey = "achievements"

    func saveProgress(_ progress: WaterProgress) {
        if let data = try? JSONEncoder().encode(progress) {
            UserDefaults.standard.set(data, forKey: progressKey)
        }
    }

    func loadProgress() -> WaterProgress {
        if let data = UserDefaults.standard.data(forKey: progressKey),
           let progress = try? JSONDecoder().decode(WaterProgress.self, from: data) {
            return progress
        }
        // Default: 0 ml, 2L goal, 0 streak
        return WaterProgress(current: 0, goal: 2000, streak: 0, lastDrinkDate: nil)
    }

    func saveSettings(_ settings: Settings) {
        if let data = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(data, forKey: settingsKey)
        }
    }

    func loadSettings() -> Settings {
        if let data = UserDefaults.standard.data(forKey: settingsKey),
           let settings = try? JSONDecoder().decode(Settings.self, from: data) {
            return settings
        }
        // Default: 2L goal, 250ml portion, focus off
        return Settings(dailyGoal: 2000, portion: 250, forestFocus: false)
    }

    func saveAchievements(_ achievements: [Achievement]) {
        if let data = try? JSONEncoder().encode(achievements) {
            UserDefaults.standard.set(data, forKey: achievementsKey)
        }
    }

    func loadAchievements() -> [Achievement] {
        if let data = UserDefaults.standard.data(forKey: achievementsKey),
           let achievements = try? JSONDecoder().decode([Achievement].self, from: data) {
            return achievements
        }
        // Default: empty
        return []
    }
}
