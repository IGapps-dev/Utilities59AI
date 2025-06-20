//
//  Untitled.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import SwiftUI

struct TreeView: View {
    @StateObject var viewModel = TreeViewModel()
    @StateObject var viewModelAchive = AchievementsViewModel()
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            // Tree animation
            Text(viewModel.treeEmoji)
                .font(.system(size: 120))
                .scaleEffect(viewModel.animateTree ? 1.15 : 1.0)
                .animation(.interpolatingSpring(stiffness: 200, damping: 10), value: viewModel.animateTree)
            // Spirit message
            Text(viewModel.spiritMessage)
                .font(.headline)
                .padding()
            // Progress
            ProgressView(value: Double(viewModel.progress.current), total: Double(viewModel.progress.goal))
                .accentColor(.green)
            Text("\(viewModel.progress.current) / \(viewModel.progress.goal) ml (\(viewModel.progressPercent)%)")
                .font(.subheadline)
            // Drink button
            Button(action: {
                viewModelAchive.unlock("first_drop")
                viewModel.drinkWater()
                if viewModel.compareDates() || viewModel.dailyTime == "" {
                    viewModel.saveCurrentDate()
                }
                if viewModel.goal {
                    viewModelAchive.unlock("daily_stream")
                }
                
                if viewModel.daysStack >= 7 {
                    viewModelAchive.unlock("seven_day_bloom")
                }
//                viewModel.deleteAllUserDefaltsData()
            }) {
                Label("I drank water", systemImage: "drop.fill")
                    .font(.title2)
                    .padding()
                    .background(Capsule().fill(Color.green.opacity(0.2)))
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGreen).opacity(0.1).ignoresSafeArea())
        .onAppear {
            if viewModel.compareDates() {
                viewModel.resetProgress()
            }
            
        }
        
    }
}
