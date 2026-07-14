//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Kelly Lampotang on 7/13/26.
//

import SwiftUI
import SwiftData

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView()
        }
        .modelContainer(for: DailyScrum.self)
    }
}
