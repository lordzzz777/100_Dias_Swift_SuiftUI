//
//  Model.swift
//  HabitTracking
//
//  Created by Esteban Perez Castillejo on 28/7/24.
//

import Foundation

struct HabitTrackingModel: Identifiable, Codable {
    var id = UUID()
    var title: String = ""
    var comment: String = ""
    var countHabit: CGFloat = 0.0
    var isDone: Bool = false
}

