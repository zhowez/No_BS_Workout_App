//
//  ExercisesView.swift
//  No_BS_Workout_App
//
//  Created by Zach Howes on 6/15/24.
//

import SwiftUI
import SwiftData

struct ExercisesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var exercises: [Exercise]
    @State var selectedExercise:Exercise? = nil

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(exercises) { exercise in
                    NavigationLink {
                        ExerciseView(selectedExercise: $selectedExercise)
                    } label: {
                        Text(exercise.exerciseTitle)
                    }.onAppear(perform: {
                        selectedExercise = exercise
                    })
                    
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                    
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Exercise(title: "New Exercise",description: "Edit me")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(exercises[index])
            }
        }
    }
    

}

#Preview {
    ExercisesView()
        .modelContainer(for: Exercise.self, inMemory: true)
}

