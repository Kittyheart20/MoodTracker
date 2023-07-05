//
//  CalendarView.swift
//  MoodTracker
//
//  Created by Arin Haynes on 6/11/23.
//

import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var moodStore: MoodStore
        
        var body: some View {
            VStack{
                Spacer()
                if (moodStore.moodEntries.count == 0) {
                    Text("You haven't added anything yet!")
                        .padding(20)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Text("Click \"Add Mood\" to add your first mood track")
                        .padding(20)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Spacer()
                } else {
                    List(moodStore.moodEntries.sorted(by: { $0.date > $1.date }), id: \.id) { moodEntry in
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
                }
                
                
                NavigationLink(destination: MoodView()) {
                                    Text("Add Mood")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                                .padding()
                           
            }
        }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(MoodStore())
    }
}

extension DateFormatter {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
}
