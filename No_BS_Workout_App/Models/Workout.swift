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
    var workoutTitle: String
    var workoutDescription: String
    var workoutExercises:[Exercise]
    
    init(title: String, description: String) {
        self.workoutTitle = title
        self.workoutDescription = description
        self.workoutExercises = []
    }
    
    init(title: String, description: String, ex:Exercise) {
        self.workoutTitle = title
        self.workoutDescription = description
        self.workoutExercises = []
        self.workoutExercises.append(ex)
    }
    
    func addExercise(e:Exercise) {
        self.workoutExercises.append(e)
    }
    
    func getExerciseLength() -> Int {
        return self.workoutExercises.count
    }

}
