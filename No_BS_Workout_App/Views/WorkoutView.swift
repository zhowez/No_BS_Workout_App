//
//  WorkoutView.swift
//  No_BS_Workout_App
//
//  Created by Zach Howes on 6/15/24.
//

import SwiftUI

struct WorkoutView: View {
    @Binding var selectedWorkout:Workout?
    var body: some View {
        Text("Workout Name: \(selectedWorkout?.workoutTitle ?? "w")")
        Text("Description: \(selectedWorkout?.workoutDescription ?? "w")")
    }
}

#Preview {
        
    WorkoutView(selectedWorkout: .constant(Workout(title: "Test Workout View", description: "This is a test workoutview")))

}
