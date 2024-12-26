//
//  ConferenceView.swift
//  ProjectTracker
//
//  Created by Dani on 17/12/2024.
//

import SwiftUI
import SwiftData

struct ConferenceView: View {
    @Environment(\.modelContext) private var modelContext
    
    private let conference: Conference
    
    init(conference: Conference) {
        self.conference = conference
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("How much did you like the conference?")
                .font(.headline)
            Spacer()
        }
        .padding()
        .navigationTitle(conference.name)
    }
}

#Preview {
    ConferenceView(conference: Conference(name: "NSSpain", rating: 5.0))
        .modelContainer(for: Conference.self, inMemory: true)
}
