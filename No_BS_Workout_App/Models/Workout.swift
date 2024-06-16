//
//  Item.swift
//  No_BS_Workout_App
//
//  Created by Zach Howes on 6/15/24.
//

import Foundation
import SwiftData

@Model
final class Workout {
    //var timestamp: Date
    var workoutTitle: String
    var workoutDescription: String
    
    init(title: String, description: String) {
        self.workoutTitle = title
        self.workoutDescription = description
    }
}
