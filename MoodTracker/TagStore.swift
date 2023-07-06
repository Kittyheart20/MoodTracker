//
//  TagStore.swift
//  MoodTracker
//
//  Created by Arin Haynes on 6/12/23.
//

import Foundation

class TagStore: ObservableObject {
    @Published var tags: [String] = [
    "School",
    "Work",
    "Friends"
    ]

    func addTag(tag: String) {
        guard !tags.contains(tag) else {
            return
        }

        tags.append(tag)
    }
}
