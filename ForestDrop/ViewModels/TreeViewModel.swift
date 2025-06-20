//
//  Untitled.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import Foundation
import SwiftUI

class TreeViewModel: ObservableObject {
    @Published var progress: WaterProgress
    @Published var settings: Settings
    @Published var spiritMessage: String = "Welcome to the forest! 🌳"
    @Published var treeStage: Int = 0 // 0-3
    @Published var treeEmoji: String = "🌱"
    @Published var progressPercent: Int = 0
    @Published var animateTree: Bool = false
    
    @AppStorage("dailyTime") var dailyTime: String = ""
    
    @AppStorage("first") var first: Bool = false
    @AppStorage("goal") var goal: Bool = false
    @AppStorage("daysStack") var daysStack: Int = 0
    
    let spiritPhrases = [
        "Thank you! The tree feels stronger! 🌿",
        "The forest is grateful! 🍃",
        "You help the magic grow! ✨",
        "Wonderful! The spirit is happy! 🧚"
    ]

    init() {
        self.progress = UserDefaultsManager.shared.loadProgress()
        self.settings = UserDefaultsManager.shared.loadSettings()
        updateTreeStage()
        updateProgressPercent()
    }

    func saveCurrentDate() {
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dailyTime = dateFormatter.string(from: currentDate)
        print("daily: \(dailyTime)")
    }
    
    func compareDates() -> Bool {
        var isShown:Bool = true
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        if let lastActionDate = dateFormatter.date(from: dailyTime) {
            let timeSinceLastAction = Date().timeIntervalSince(lastActionDate)
            // Дальнейшая логика сравнения времени
          
            if timeSinceLastAction > 86400 {
               isShown = true
                print("true")
            } else {
                isShown = false
                
                print("false")
            }
        }
        return isShown
    }
    
    func drinkWater() {
        let today = Calendar.current.startOfDay(for: Date())
        let lastDrinkDay = progress.lastDrinkDate.map { Calendar.current.startOfDay(for: $0) }
        if lastDrinkDay != today {
            // New day: reset progress, update streak
            if let last = lastDrinkDay, Calendar.current.date(byAdding: .day, value: 1, to: last) == today {
                progress.streak += 1
            } else {
                progress.streak = 1
            }
            progress.current = 0
        }
        progress.current += settings.portion
        progress.lastDrinkDate = Date()
        progress.goal = settings.dailyGoal
        if progress.current >= progress.goal {
//            progress.current = progress.goal
            goal = true
            daysStack += 1
        }
        UserDefaultsManager.shared.saveProgress(progress)
        updateTreeStage()
        updateProgressPercent()
        spiritMessage = spiritPhrases.randomElement() ?? "Thank you!"
        withAnimation(.interpolatingSpring(stiffness: 200, damping: 10)) {
            animateTree.toggle()
        }
    }

    func updateTreeStage() {
        let percent = Double(progress.current) / Double(progress.goal)
        switch percent {
        case 0..<0.25:
            treeStage = 0
            treeEmoji = "🌱"
        case 0.25..<0.7:
            treeStage = 1
            treeEmoji = "🌿"
        case 0.7..<1.0:
            treeStage = 2
            treeEmoji = "🌳"
        default:
            treeStage = 3
            treeEmoji = "🌳✨"
        }
    }

    func updateProgressPercent() {
        progressPercent = Int((Double(progress.current) / Double(progress.goal)) * 100)
    }

    func resetProgress() {
        progress.current = 0
        progress.lastDrinkDate = nil
        UserDefaultsManager.shared.saveProgress(progress)
        updateTreeStage()
        updateProgressPercent()
        spiritMessage = "Progress reset! The tree awaits your care. 🍃"
    }
    
    func deleteAllUserDefaltsData() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
    }
}



