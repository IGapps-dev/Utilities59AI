//
//  Untitled.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import Foundation

struct BenefitCard: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let symbol: String
    let spiritPhrase: String
}

class BenefitsViewModel: ObservableObject {
    @Published var cards: [BenefitCard] = [
        BenefitCard(
            title: "Energy",
            message: "Water gives you energy — just like it does to me! 💧\n\nStaying hydrated helps your body transport nutrients, regulate temperature, and keep you feeling fresh all day.",
            symbol: "bolt.fill",
            spiritPhrase: "Stay energized! ⚡️"
        ),
        BenefitCard(
            title: "Focus",
            message: "Hydration helps you concentrate.\n\nEven mild dehydration can affect your mood, memory, and attention. Drink water to keep your mind sharp and clear.",
            symbol: "eye.fill",
            spiritPhrase: "Clear mind, clear forest! 🌿"
        ),
        BenefitCard(
            title: "Health",
            message: "Water supports your body and the magic tree.\n\nIt helps your joints, protects organs, and flushes out toxins. Every sip is a gift to your health!",
            symbol: "heart.fill",
            spiritPhrase: "Healthy you, happy spirit! 🧚"
        ),
        BenefitCard(
            title: "Beauty",
            message: "Water keeps your skin glowing and fresh.\n\nProper hydration helps maintain skin elasticity and a radiant look — just like dew on morning leaves.",
            symbol: "sparkles",
            spiritPhrase: "Shine bright! ✨"
        ),
        BenefitCard(
            title: "Mood",
            message: "Drinking water can boost your mood and reduce stress.\n\nA well-hydrated brain is a happy brain. The forest spirit always feels better after a drink!",
            symbol: "smiley",
            spiritPhrase: "Smile with every sip! 😊"
        )
    ]
}
