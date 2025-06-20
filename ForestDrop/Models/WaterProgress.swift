//
//  WaterProgress.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import Foundation

struct WaterProgress: Codable {
    var current: Int // ml
    var goal: Int // ml
    var streak: Int // days in a row
    var lastDrinkDate: Date?
}
