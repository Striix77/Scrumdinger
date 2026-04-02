//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Freak on 31.03.2026.
//

import SwiftData
import SwiftUI
import ThemeKit

struct DetailView: View {
    @State private var isPresentingEditView = false
    @State private var errorWrapper: ErrorWrapper?
    let scrum: DailyScrum

    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink {
                    MeetingView(scrum: scrum, errorWrapper: $errorWrapper)
                } label: {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundStyle(.blue)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name.capitalized)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            Section(header: Text("History")) {
                if scrum.history.isEmpty {
                    Label(
                        "No meetings yet",
                        systemImage: "calendar.badge.exclamationmark"
                    )
                }
                ForEach(scrum.history) { history in
                    NavigationLink {
                        HistoryView(history: history)
                    } label: {
                        HStack {
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(
                    scrum: scrum
                )
                .navigationTitle(scrum.title)

            }
        }
        .sheet(item: $errorWrapper, onDismiss: nil) { wrapper in
            ErrorView(errorWrapper: wrapper)
        }
    }
}
#Preview(traits: .dailyScrumsSampleData) {
    @Previewable @Query(sort: \DailyScrum.title) var scrums: [DailyScrum]
    NavigationStack {
        DetailView(scrum: scrums[0])
    }
}
