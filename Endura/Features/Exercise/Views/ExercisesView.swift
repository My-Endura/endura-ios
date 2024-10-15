//
//  ExercisesView.swift
//  Endura
//
//  Created by Florian Rohrauer on 15.10.24.
//

import SwiftUI

struct ExercisesView: View {
    @StateObject
    var viewModel = ExercisesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.state {
                case .idle, .loading:
                    ProgressView()
                    
                case .error(let errorMessage):
                    Text(errorMessage)
                    
                case .success:
                    ExercisesListView(exercises: viewModel.filteredExercises)
                }
            }
            .task { await viewModel.loadExercises() }
            .navigationTitle("Exercises")
            .searchable(text: $viewModel.search)
        }
    }
}

#Preview {
    NavigationStack {
        ExercisesView()
    }
}
