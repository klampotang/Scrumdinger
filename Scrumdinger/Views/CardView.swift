//
//  CardView.swift
//  Scrumdinger
//
//  Created by Kelly Lampotang on 7/13/26.
//

import SwiftUI
import ThemeKit

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                let attendeesCount = scrum.attendees.count
                let meetingLength = scrum.lengthInMinutes
                Label("\(attendeesCount)", systemImage: "person.3.fill")
                    .accessibilityLabel("\(attendeesCount) attendees")
                Spacer()
                Label("\(meetingLength)", systemImage: "clock")
                    .padding(.trailing, 20)
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(meetingLength) minute meeting")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 60)) {
    let scrum = DailyScrum.sampleData[0]
    CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
}
