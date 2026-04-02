//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Freak on 01.04.2026.
//

import SwiftUI

struct NewScrumSheet: View {
    var body: some View {
        NavigationStack {
            DetailEditView(
                scrum: nil
            )
        }
    }
}

#Preview {
    NewScrumSheet()
}
