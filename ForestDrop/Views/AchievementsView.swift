//
//  Untitled.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import SwiftUI

struct AchievementsView: View {
    @StateObject var viewModel = AchievementsViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ForEach(viewModel.achievements) { achievement in
                    HStack {
                        Text(achievement.emoji)
                            .font(.system(size: 48))
                        VStack(alignment: .leading) {
                            Text(achievement.title)
                                .font(.headline)
                            Text(achievement.description)
                                .font(.subheadline)
                            if achievement.isUnlocked {
                                Text("Unlocked! 🎉")
                                    .foregroundColor(.green)
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .background(achievement.isUnlocked ? Color.green.opacity(0.2) : Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
            }
            .onAppear {
                print("1: \(viewModel.achievements[0].isUnlocked)")
                print("2: \(viewModel.achievements[1].isUnlocked)")
                print("3: \(viewModel.achievements[2].isUnlocked)")
            }
            .padding()
        }
    }
}
