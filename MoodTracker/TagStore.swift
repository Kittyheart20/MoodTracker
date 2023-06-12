//
//  TagStore.swift
//  MoodTracker
//
//  Created by Arin Haynes on 6/12/23.
//

import Foundation
import Combine
import SwiftUI

class TagStore: ObservableObject {
    @Published var tags: Set<String> = []
}
