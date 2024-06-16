//
//  ExerciseView.swift
//  No_BS_Workout_App
//
//  Created by Zach Howes on 6/15/24.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var selectedExercise:Exercise

    var body: some View {
        VStack{
            VStack{}.frame(minHeight: 5, idealHeight: 20,maxHeight: 50)
            VStack{
                Text("Exercise")
                TextField("Exercise Name: ", text: $selectedExercise.exerciseTitle)
                    .frame(minWidth: 150, idealWidth: 150,maxWidth: 150, alignment: .center)
                    .multilineTextAlignment(.center)
            }.frame(maxWidth: .infinity, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            VStack{
                Text("Description")
                textEditorVw
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
    }
}

private extension ExerciseView {
    var textEditorVw: some View {
        TextEditor(text:$selectedExercise.exerciseDescription)
            .frame(minWidth: 150, idealWidth: 300,maxWidth: 350,minHeight: 100, idealHeight: 150, maxHeight: 200)
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(.gray.opacity(0.2), lineWidth: 4))
    }
}

#Preview {
        
    ExerciseView(selectedExercise: .constant(Exercise(title: "Test Exercise View", description: "This is a test exercise view")))

}
