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
    @State private var rating: Double
    
    private let conference: Conference
    
    init(conference: Conference) {
        self.conference = conference
        self.rating = conference.rating
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("How much did you like the conference?")
                .font(.headline)
            /// Exercise: Use a custom rating component that let's you choose from 1 to 5 thumbs up (0 when unrated), instead of a native Slider
//            Slider(value: $rating,
//                   in: 0...5,
//                   step: 1.0,
//                   label: {
//                Text("Rating")
//            }) { _ in
//                conference.rating = rating
//            }
            RatingView(rating: $rating) {
                conference.rating = rating
            }
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
