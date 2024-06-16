//
//  Item.swift
//  No_BS_Workout_App
//
//  Created by Zach Howes on 6/15/24.
//

import Foundation
import SwiftData

@Model
final class Exercise {
    //var timestamp: Date
    var exerciseTitle: String
    var exerciseDescription: String
    
    init(title: String, description: String) {
        self.exerciseTitle = title
        self.exerciseDescription = description
    }
}
