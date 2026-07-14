//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Kelly Lampotang on 7/13/26.
//

import SwiftUI
import ThemeKit
import TimerKit

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @State var scrumTimer = ScrumTimer()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
            .padding()
        }
        .onAppear() {
            startScrum()
        }
        .onDisappear() {
            endScrum()
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)

    }
    
    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendeeNames: scrum.attendees.map(\.name))
        scrumTimer.startScrum()
    }
    
    private func endScrum() {
        scrumTimer.stopScrum()
        let history = History(attendees: scrum.attendees)
        scrum.history.append(history)
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: $scrum)
}
