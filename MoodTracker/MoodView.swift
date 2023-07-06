//
//  MoodView.swift
//  MoodTracker
//
//  Created by Arin Haynes on 6/11/23.
//

import SwiftUI

struct MoodView: View {
    @EnvironmentObject var moodStore: MoodStore
    @EnvironmentObject var tagStore: TagStore
    @State private var selectedMood: Mood?
    @State private var note: String = ""
    @State private var selectedTags: Set<String> = []
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            Text("How are you feeling today?")
                .font(.largeTitle)
            
            HStack(spacing: 30) {
                MoodButton(mood: .happy, selectedMood: $selectedMood)
                MoodButton(mood: .neutral, selectedMood: $selectedMood)
                MoodButton(mood: .sad, selectedMood: $selectedMood)
            }
            
            Text("Select Tags:")
                .font(.headline)
                            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(tagStore.tags, id: \.self) { tag in
                        TagButton(tag: tag, selectedTags: $selectedTags)
                    }
                }
                .padding(.horizontal)
            }
            
            Text("Add a note (optional):")
                .font(.headline)
            
            TextEditor(text: $note)
                .frame(height: 100)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            
            
            Button(action: {
                saveMood()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
    
    private func saveMood() {
            guard let selectedMood = selectedMood else {
                return 
            }
            
        let moodEntry = MoodEntry(date: Date(), mood: selectedMood, note: note, tags: selectedTags.isEmpty ? nil : selectedTags)
            moodStore.addMoodEntry(moodEntry: moodEntry)
             
        }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
            .environmentObject(MoodStore())
            .environmentObject(TagStore())
    }
}

struct TagButton: View {
    let tag: String
    @Binding var selectedTags: Set<String>
    
    var body: some View {
        Button(action: {
            if selectedTags.contains(tag) {
                selectedTags.remove(tag)
            } else {
                selectedTags.insert(tag)
            }
        }) {
            Text(tag)
                .padding()
                .foregroundColor(selectedTags.contains(tag) ? .white : .blue)
                .background(selectedTags.contains(tag) ? Color.blue : Color.clear)
                .cornerRadius(10)
        }
    }
}
