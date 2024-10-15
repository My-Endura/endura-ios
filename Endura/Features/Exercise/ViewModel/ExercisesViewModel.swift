//
//  ExercisesViewModel.swift
//  Endura
//
//  Created by Florian Rohrauer on 15.10.24.
//

import Foundation

@MainActor
class ExercisesViewModel: ObservableObject {
    
    @Published
    var state: ViewState<[Exercise]> = ViewState.idle
    
    @Published
    var search = ""
    
    var filteredExercises: [Exercise] {
        if case .success(let exercises) = state {
            if search.isEmpty {
                return exercises
            }
            return exercises.filter { exercise in
                exercise.name.lowercased().contains(search.lowercased())
            }
        }
        return []
    }
    
    func loadExercises() async {
        state = .loading
        
        do {
            let response = try await ExerciseService.shared.getAllExercises()
            state = .success(response)
        } catch is NetworkError {
            state = .error("failed to reach server")
        } catch let error as ApiError {
            state = .error(error.errorResponse.message)
        } catch {
            state = .error("an unknown error has occured")
        }
    }
}
