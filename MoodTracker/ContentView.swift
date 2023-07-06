//
//  ContentView.swift
//  MoodTracker
//
//  Created by Arin Haynes on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var moodStore: MoodStore
    @EnvironmentObject var tagStore: TagStore
    @State private var selectedMood: Mood?
    @State private var note: String = ""
    @State private var showMoodView = false
    @State private var showTagView = false
    
    var body: some View {
        NavigationView {
            if showMoodView {
                MoodView()
            } else if showTagView {
                TagView()
            } else {
                CalendarView()
            }
        }
        .environmentObject(moodStore)
        .environmentObject(TagStore())
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MoodStore())
            .environmentObject(TagStore())
    }
}

struct MoodButton: View {
    let mood: Mood
    @Binding var selectedMood: Mood?
    
    var body: some View {
        Button(action: {
            selectedMood = mood
        }) {
            Image(systemName: mood.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }
        .frame(width: 80, height: 80)
        .background(selectedMood == mood ? Color.gray.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
}

enum Mood: String {
    case happy, neutral, sad
    
    var icon: String {
        switch self {
        case .happy:
            return "hand.thumbsup"
        case .neutral:
            return "hand.raised"
        case .sad:
            return "hand.thumbsdown"
        }
    }
}
