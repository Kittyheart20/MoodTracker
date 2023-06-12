//
//  MoodTrackerApp.swift
//  MoodTracker
//
//  Created by Arin Haynes on 6/11/23.
//

import SwiftUI

@main
struct MoodTrackerApp: App {

    @StateObject private var moodStore = MoodStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(moodStore)
        }
    }
}
