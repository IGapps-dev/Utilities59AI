//
//  Untitled.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published var pages: [OnboardingPage] = [
        OnboardingPage(title: "Welcome!", message: "I'm your forest spirit. Let's help the magic tree grow by drinking water! 💧", emoji: "🧚"),
        OnboardingPage(title: "How it works", message: "Tap 'I drank water' to add water. Watch the tree grow as you progress! 🌳", emoji: "🌱"),
        OnboardingPage(title: "Set your goal", message: "Choose your daily water goal to keep the forest healthy! 🍃", emoji: "🎯")
    ]
    @Published var currentPage: Int = 0
}
