//
//  CalendarView.swift
//  MoodTracker
//
//  Created by Arin Haynes on 6/11/23.
//

import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var moodStore: MoodStore
    @EnvironmentObject var tagStore: TagStore
    @State private var selectedMoodEntry: MoodEntry? = nil
    
    var body: some View {
        VStack {
            if moodStore.moodEntries.isEmpty {
                Text("You haven't added anything yet!")
                    .padding(20)
                    .font(.title)
                    .multilineTextAlignment(.center)
                Text("Click \"Add Mood\" to add your first mood track")
                    .padding(20)
                    .font(.title)
                    .multilineTextAlignment(.center)
            } else {
                List(moodStore.moodEntries.sorted(by: { $0.date > $1.date }), id: \.id) { moodEntry in
                    Button(action: {
                        selectedMoodEntry = moodEntry
                    }) {
                        VStack {
                            HStack {
                                Text("\(moodEntry.date, formatter: DateFormatter.shortDate)")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(moodEntry.mood.rawValue.capitalized)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(moodEntry.note ?? "")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding([.leading, .trailing])
                    }
                    .buttonStyle(PlainButtonStyle())
                    .sheet(item: $selectedMoodEntry) { moodEntry in
                        MoodDetailView(moodEntry: moodEntry)
                    }
                }
            }
            
            NavigationLink(destination: TagView()) {
                Text("Add Tags")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            NavigationLink(destination: MoodView()) {
                Text("Add Mood")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(MoodStore())
            .environmentObject(TagStore())
    }
}

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
