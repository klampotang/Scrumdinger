//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Kelly Lampotang on 7/14/26.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum) { dailyScrum in
                scrums.append(dailyScrum)
            }
        }
    }
}

#Preview {
    @Previewable @State var newScrum = DailyScrum.sampleData[0]
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData))
}
