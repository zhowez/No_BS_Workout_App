//
//  ExerciseView.swift
//  No_BS_Workout_App
//
//  Created by Zach Howes on 6/15/24.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var selectedExercise:Exercise?
    var body: some View {
        Text("Exercise Name: \(selectedExercise?.exerciseTitle ?? "t")")
        Text("Description: \(selectedExercise?.exerciseDescription ?? "t")")
    }
}

#Preview {
        
    ExerciseView(selectedExercise: .constant(Exercise(title: "Test Exercise View", description: "This is a test exercise view")))

}
