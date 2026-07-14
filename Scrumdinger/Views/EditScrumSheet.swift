//
//  EditScumSheet.swift
//  Scrumdinger
//
//  Created by Kelly Lampotang on 7/14/26.
//

import SwiftUI

struct EditScrumSheet: View {
    @Binding var editingScrum: DailyScrum
    var onSave: () -> Void
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum) { scrum in
                editingScrum = scrum
                onSave()
            }
            .navigationTitle(editingScrum.title)
        }
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    EditScrumSheet(editingScrum: $scrum, onSave: {})
}
