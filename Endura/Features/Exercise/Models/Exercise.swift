//
//  Exercise.swift
//  Endura
//
//  Created by Florian Rohrauer on 15.10.24.
//

import Foundation

struct Exercise: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String?
    let instructions: String?
    let muscleGroups: [MuscleGroup]
    
    init(id: UUID = UUID(), name: String, description: String?, instructions: String?, muscleGroups: [MuscleGroup]) {
        self.id = id
        self.name = name
        self.description = description
        self.instructions = instructions
        self.muscleGroups = muscleGroups
    }
}

extension Exercise {
    static let sampleData: [Exercise] = [
        Exercise(name: "Kniebeugen", description: "Eine Übung für die Beine",
                 instructions: "Stell dich mit den Füßen schulterbreit auseinander und beuge die Knie, als ob du dich hinsetzen würdest.", muscleGroups: [MuscleGroup.sampleData[1]]),
        Exercise(name: "Liegestütze", description: "Eine Übung für die Brust und Arme", instructions: "Leg dich auf den Bauch, stütze dich auf die Hände und die Zehen, und senke deinen Körper bis fast zum Boden.", muscleGroups: [MuscleGroup.sampleData[0]]),
        Exercise(name: "Bauchpressen", description: "Eine Übung für die Bauchmuskeln", instructions: "Lieg auf dem Rücken, die Beine angewinkelt, und hebe den Oberkörper an, als ob du dich aufsetzen würdest.", muscleGroups: [MuscleGroup.sampleData[1]]),
        Exercise(name: "Klimmzüge", description: "Eine Übung für den oberen Rücken", instructions: "Häng dich an eine Stange und zieh deinen Körper nach oben, bis dein Kinn über der Stange ist.", muscleGroups: [MuscleGroup.sampleData[2]]),
        Exercise(name: "Plank", description: "Eine Übung für die Körpermitte", instructions: "Stütz dich auf die Unterarme und die Zehen, halte deinen Körper in einer geraden Linie.", muscleGroups: [MuscleGroup.sampleData[3]])
    ]
}
