//
//  ConferenceTrackerApp.swift
//  ConferenceTracker
//
//  Created by Dani on 17/12/2024.
//

import SwiftUI
import SwiftData

@main
struct ConferenceTrackerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Conference.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}