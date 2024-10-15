//
//  ExerciseService.swift
//  Endura
//
//  Created by Florian Rohrauer on 15.10.24.
//

import Foundation

class ExerciseService {
    static let shared = ExerciseService()
    
    func getAllExercises() async throws -> [Exercise] {
        return try await RestClient.shared.get(path: "/exercise")
    }
}
