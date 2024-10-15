//
//  ExercisesListView.swift
//  Endura
//
//  Created by Florian Rohrauer on 15.10.24.
//

import SwiftUI

struct ExercisesListView: View {
    let exercises: [Exercise]
    
    var body: some View {
        List {
            ForEach(exercises) { exercise in
                NavigationLink(destination: ExerciseDetailsView(exercise: exercise)) {
                    Label(exercise.name, systemImage: "dumbbell.fill")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ExercisesListView(exercises: Exercise.sampleData)
    }
}
