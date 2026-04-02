//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Freak on 31.03.2026.
//

import SwiftUI
import SwiftData

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView()
        }
        .modelContainer(for: DailyScrum.self)
    }
}
