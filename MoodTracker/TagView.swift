//
//  TagView.swift
//  MoodTracker
//
//  Created by Arin Haynes on 7/5/23.
//

import SwiftUI

struct TagView: View {
    @EnvironmentObject var tagStore: TagStore
    @State private var tagName: String = ""

    var body: some View {
        VStack {
            TextField("Enter tag name", text: $tagName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                addTag()
                tagName = ""
            }) {
                Text("Add Tag")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Text("Your tags:")
                .font(.title)
                .padding()
            if (!tagStore.tags.isEmpty) {
                List(tagStore.tags, id: \.self) { tag in
                    Text(tag)
                }
            } else {
                Spacer()
                Text("You have no tags! \n\n Click \"Add Tag\" to make your first tag")
                    .font(.title)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Tags")
    }

    private func addTag() {
        guard !tagName.isEmpty else {
            return
        }

        tagStore.addTag(tag: tagName)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
            .environmentObject(TagStore())
    }
}
