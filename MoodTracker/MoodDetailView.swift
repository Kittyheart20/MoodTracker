//
//  MoodDetailView.swift
//  MoodTracker
//
//  Created by Arin Haynes on 7/6/23.
//

import SwiftUI

struct MoodDetailView: View {
    let moodEntry: MoodEntry
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var moodStore: MoodStore
    
    var body: some View {
        VStack(spacing: 40) {
            VStack() {
                Text("Mood")
                    .font(.caption)
                Text(moodEntry.mood.rawValue.capitalized)
                    .font(.title)
            }
            .padding(30)
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            
            // Tags
            if let tags = moodEntry.tags {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Tags")
                        .font(.caption)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(tags.sorted(), id: \.self) { tag in
                                Text(tag)
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 6)
                                    .background(Color.blue)
                                    .cornerRadius(20)
                            }
                        }
                    }
                }
                .padding(.horizontal, 50)
            }
            
            // Note
            if let note = moodEntry.note {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Note")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(note)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .padding(.horizontal, 50)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
            
            // Delete Button
            Button(action: {
                deleteMoodEntry()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Delete Mood")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
            .foregroundColor(.blue)
        }
    }
    
    private func deleteMoodEntry() {
        moodStore.deleteMoodEntry(moodEntry: moodEntry)
    }
}

struct MoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let moodEntry = MoodEntry(date: Date(), mood: .happy, note: "Feeling great!", tags: ["happy", "positive"])
        
        return MoodDetailView(moodEntry: moodEntry)
            .environmentObject(MoodStore())
    }
}
