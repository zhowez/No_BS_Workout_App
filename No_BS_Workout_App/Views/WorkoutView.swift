//
//  WorkoutView.swift
//  No_BS_Workout_App
//
//  Created by Zach Howes on 6/15/24.
//

import SwiftUI
import SwiftData

struct WorkoutView: View {
    @Binding var selectedWorkout:Workout
    @Query private var exercises: [Exercise]
    @State private var isShowingPicker = false
    @State private var newExercise:Exercise?
    
    var body: some View {
        Text("Workout Name: \(selectedWorkout.workoutTitle)")
        Text("Description: \(selectedWorkout.workoutDescription)")
        Text("Exercises:")
        List {
            if (selectedWorkout.getExerciseLength() == 0) {
                Text("Add Exercises Now")
            } else {
                ForEach(selectedWorkout.workoutExercises) { exercise in
                    Text("\(exercise.exerciseTitle)")
                }
                .onDelete(perform: deleteExercise)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button(action: {
                    isShowingPicker = true // Show the picker when button is tapped
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                
        }
        .popover(isPresented: $isShowingPicker, arrowEdge: .bottom) {
                   // Content of the popover (Picker)
                   VStack {
                       Text("Select Exercise")
                           .font(.headline)
                           .padding()

                       Picker("Exercise", selection: $newExercise) {
                           Text("").tag(nil as Exercise?)
                           ForEach(exercises, id: \.self) { exercise in
                               Text(exercise.exerciseTitle)
                                   .tag(exercise as Exercise?)
                           }
                       }
                       .pickerStyle(WheelPickerStyle())

                    HStack {
                           Button("Cancel") {
                                isShowingPicker = false // Dismiss the popover without adding
                                          }
                                .padding()

                                Spacer()

                                Button("Add") {
                                    addExercise() // Perform action to add exercise
                                }
                                .padding()
                            }
                   }
                   .padding()
               }
        
    }

    private func addExercise() {
           withAnimation {
               if let exercise = newExercise {
                   selectedWorkout.workoutExercises.append(exercise)
               }
               
               isShowingPicker = false // Dismiss the popover after adding or canceling
           }
       }
    
    private func deleteExercise(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                selectedWorkout.workoutExercises.remove(at: index)
            }
        }
    }
}




private extension WorkoutView {
    var textEditorVw: some View {
        TextEditor(text:$selectedWorkout.workoutTitle)
            .frame(minWidth: 150, idealWidth: 300,maxWidth: 350,minHeight: 100, idealHeight: 150, maxHeight: 200)
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(.gray.opacity(0.2), lineWidth: 4))
    }
}


#Preview {
        
    WorkoutView(selectedWorkout: .constant(Workout(title: "Test Workout View", description: "This is a test workoutview")))

}
