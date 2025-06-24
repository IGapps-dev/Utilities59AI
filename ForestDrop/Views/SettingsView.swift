//
//  Untitled.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = SettingsViewModel()

    var body: some View {
        Form {
            Section(header: Text("Daily Goal")) {
                Stepper(value: $viewModel.settings.dailyGoal, in: 1000...4000, step: 100) {
                    Text("\(viewModel.settings.dailyGoal) ml")
                }
            }
            Section(header: Text("Portion Size")) {
                Picker("Portion", selection: $viewModel.settings.portion) {
                    Text("100 ml").tag(100)
                    Text("200 ml").tag(200)
                    Text("250 ml").tag(250)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Forest Focus")) {
                Toggle("Forest Focus Mode", isOn: $viewModel.settings.forestFocus)
            }
            Section {
                Button("Reset Progress") {
                    UserDefaultsManager.shared.saveProgress(WaterProgress(current: 0, goal: viewModel.settings.dailyGoal, streak: 0, lastDrinkDate: nil))
                }
                Button("Privacy Policy") {
                    if let url = URL(string: "https://www.freeprivacypolicy.com/live/90546727-32e5-4118-b920-e800283fa727 ") {
                        UIApplication.shared.open(url)
                    }
                }
                Button("Terms of Use") {
                    if let url = URL(string: "https://www.freeprivacypolicy.com/live/626c6f13-3374-485b-8f81-35b48f484db6") {
                        UIApplication.shared.open(url)
                    }
                }
            }
            
            Section(header: Text("Disclaimer")) {
                Text("The information in this app is for general wellness and entertainment purposes only and is not intended as medical advice. Always consult a qualified healthcare professional before making any health-related decisions.")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}
