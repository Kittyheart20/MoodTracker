//
//  MoodStore.swift
//  MoodTracker
//
//  Created by Arin Haynes on 6/11/23.
//

import Foundation
import SwiftUI
import Combine

class MoodStore: ObservableObject {
    @Published var moodEntries: [MoodEntry] = [
        /*MoodEntry.init(date: .now, mood: .happy, note: "Sunshine", tags: <#T##Set<String>#>),
        MoodEntry.init(date: .now, mood: .neutral, note: "Meh", tags: <#T##Set<String>#>),
        MoodEntry.init(date: .now, mood: .sad, note: "Everything bagel", tags: <#T##Set<String>#>)*/
        
        MoodEntry.init(date: Date(), mood: .happy, note: "Had a great day!", tags: ["party", "friends"]),
        MoodEntry.init(date: Date().addingTimeInterval(-86400), mood: .sad, note: nil, tags: ["work"]),
        MoodEntry.init(date: Date().addingTimeInterval(-172800), mood: .neutral, note: "An ordinary day.", tags: nil)


    ]
    
    func addMoodEntry(moodEntry: MoodEntry) {
        moodEntries.append(moodEntry)
    }
}
