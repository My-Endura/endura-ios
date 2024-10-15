//
//  EnduraApp.swift
//  Endura
//
//  Created by Florian Rohrauer on 06.10.24.
//

import SwiftUI

@main
struct EnduraApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ExercisesView()
            }
        }
    }
}
