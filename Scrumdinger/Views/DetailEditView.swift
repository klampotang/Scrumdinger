//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Kelly Lampotang on 7/14/26.
//

import SwiftUI
import ThemeKit
import SwiftData

struct DetailEditView: View {
    let scrum: DailyScrum
    
    @State private var attendeeName: String = ""
    @State private var title: String
    @State private var theme: Theme
    @State private var lengthInMinutesDouble: Double
    @State private var attendees: [Attendee]

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    private let isCreatingScrum: Bool
    
    init(scrum: DailyScrum?) {
        let scrumToEdit: DailyScrum
        if let scrum {
            scrumToEdit = scrum
            isCreatingScrum = false
        } else {
            scrumToEdit = DailyScrum(title: "", attendees: [], lengthInMinutes: Int(MeetingConstants.defaultMeetingLength), theme: .sky)
            isCreatingScrum = true
        }


        self.scrum = scrumToEdit
        self.title = scrumToEdit.title
        self.lengthInMinutesDouble = scrumToEdit.lengthInMinutesDouble
        self.attendees = scrumToEdit.attendees
        self.theme = scrumToEdit.theme
    }
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Meeting Title", text: $title)
                HStack {
                    Slider(value: $lengthInMinutesDouble, in: MeetingConstants.defaultMeetingLength...MeetingConstants.maxMeetingLength, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(lengthInMinutesDouble)) minutes")
                    Spacer()
                    Text("\(Int(lengthInMinutesDouble)) minutes")
                        .accessibilityHidden(true)
                }
                ThemePicker(selection: $theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New attendee", text: $attendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = Attendee(name: attendeeName)
                            attendees.append(attendee)
                            attendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(attendeeName.isEmpty)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    saveEdits()
                    dismiss()
                }
            }
        }
    }
    private func saveEdits() {
        scrum.title = title
        scrum.lengthInMinutesDouble = lengthInMinutesDouble
        scrum.attendees = attendees
        scrum.theme = theme


        if isCreatingScrum {
            context.insert(scrum)
        }


        try? context.save()
    }
}

#Preview(traits: .dailyScrumsSampleData) {
    @Previewable @Query(sort: \DailyScrum.title) var scrums: [DailyScrum]
    DetailEditView(scrum: scrums[0])
}
