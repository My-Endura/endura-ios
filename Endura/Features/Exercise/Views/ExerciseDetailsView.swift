//
//  ExerciseDetailsView.swift
//  Endura
//
//  Created by Florian Rohrauer on 15.10.24.
//

import SwiftUI

struct ExerciseDetailsView: View {
    let exercise: Exercise
    
    var body: some View {
        List {
            if let description = exercise.description {
                Section(header: Text("Description")) {
                    Text(description)
                }
            }
            Section(header: Text("Muscle groups")) {
                ForEach(exercise.muscleGroups) { muscleGroup in
                    Text(muscleGroup.name)
                }
            }
            if let instructions = exercise.instructions {
                Section(header: Text("Instruction")) {
                    Text(instructions)
                }
            }
        }
        .navigationTitle(exercise.name)
    }
}

#Preview {
    NavigationStack {
        ExerciseDetailsView(exercise: Exercise.sampleData[0])
    }
}
