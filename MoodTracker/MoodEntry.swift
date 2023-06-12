//
//  MoodEntry.swift
//  MoodTracker
//
//  Created by Arin Haynes on 6/11/23.
//

import Foundation

struct MoodEntry {
    let id = UUID()
    let date: Date
    let mood: Mood
    let note: String?
    let tags: Set<String>?
}
