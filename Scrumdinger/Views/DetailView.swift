//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Kelly Lampotang on 7/13/26.
//

import SwiftUI
import ThemeKit

struct DetailView: View {
    @Binding var scrum: DailyScrum // Need binding so this renders again when the user modifes scrum
    @State private var isPresentingEditView: Bool = false
    @State private var editingScrum = DailyScrum.emptyScrum
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
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
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(8)
                }
                .accessibilityElement(children: .combine)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                scrum = editingScrum
                                isPresentingEditView = false
                            }
                        }
                    }
            }
            
        }
    }
}

#Preview {
    @Previewable @State var scrum: DailyScrum = DailyScrum.sampleData[0]
    NavigationStack {
        DetailView(scrum: $scrum)
    }
}
