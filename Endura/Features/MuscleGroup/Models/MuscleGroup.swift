//
//  MuscleGroup.swift
//  Endura
//
//  Created by Florian Rohrauer on 15.10.24.
//

import Foundation

struct MuscleGroup: Identifiable, Codable {
    let id: UUID
    let name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

extension MuscleGroup {
    static let sampleData: [MuscleGroup] =  [
        MuscleGroup(name: "Schulter"),
        MuscleGroup(name: "Beine"),
        MuscleGroup(name: "Bauch"),
        MuscleGroup(name: "Brust"),
    ]
}
