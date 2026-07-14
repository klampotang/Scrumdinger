//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Kelly Lampotang on 7/14/26.
//

import SwiftUI
import ThemeKit

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .foregroundColor(theme.accentColor)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color(theme.mainColor))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
