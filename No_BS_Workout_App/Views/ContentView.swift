//
//  ContentView.swift
//  No_BS_Workout_App
//
//  Created by Zach Howes on 6/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selection = 2

    var body: some View {
        TabView(selection:$selection) {
            WorkoutsView()
                .tabItem {
                    Label("Workout", systemImage: "figure.strengthtraining.traditional")
                }.tag(1)
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }.tag(2)
            ExercisesView()
                .tabItem {
                    Label("Exercises", systemImage: "dumbbell.fill")
                }.tag(3)
            

        }
    }


}

#Preview {
    ContentView()

}
