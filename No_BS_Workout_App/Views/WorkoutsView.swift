//
//  WorkoutsView.swift
//  No_BS_Workout_App
//
//  Created by Zach Howes on 6/15/24.
//

import SwiftUI
import SwiftData

struct WorkoutsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var workouts: [Workout]
    @State var selectedWorkout:Workout? = nil

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(workouts) { workout in
                    NavigationLink {
                        WorkoutView(selectedWorkout: $selectedWorkout)
                    } label: {
                        Text(workout.workoutTitle)
                    }.onAppear(perform: {
                        selectedWorkout = workout
                    })
                    
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addWorkout) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
                    
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addWorkout() {
        withAnimation {
            let newItem = Workout(title: "New Workout",description: "Edit me")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(workouts[index])
            }
        }
    }
    

}

#Preview {
    WorkoutsView()
        .modelContainer(for: Workout.self, inMemory: true)
}

