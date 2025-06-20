//
//  Untitled.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import Foundation

class SettingsViewModel: ObservableObject {
    @Published var settings: Settings

    init() {
        self.settings = UserDefaultsManager.shared.loadSettings()
    }

    func updateGoal(_ goal: Int) {
        settings.dailyGoal = goal
        UserDefaultsManager.shared.saveSettings(settings)
    }

    func updatePortion(_ portion: Int) {
        settings.portion = portion
        UserDefaultsManager.shared.saveSettings(settings)
    }

    func toggleForestFocus(_ enabled: Bool) {
        settings.forestFocus = enabled
        UserDefaultsManager.shared.saveSettings(settings)
    }
}
