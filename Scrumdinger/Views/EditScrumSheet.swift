//
//  EditScumSheet.swift
//  Scrumdinger
//
//  Created by Kelly Lampotang on 7/14/26.
//

import SwiftUI

struct EditScrumSheet: View {
    let editingScrum: DailyScrum
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: editingScrum)
            .navigationTitle(editingScrum.title)
        }
    }
}

#Preview {
    let scrum = DailyScrum.sampleData[0]
    EditScrumSheet(editingScrum: scrum)
}
