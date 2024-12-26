//
//  RatingView.swift
//  ConferenceTracker
//
//  Created by Dani on 17/12/2024.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Double
    //    @State var rating: Double
    
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                let imageName = index < Int(rating) ? "hand.thumbsup.fill" : "hand.thumbsup"
                Button("Thumbs up",
                       systemImage: imageName) {
                    rating = Double(index + 1)
                }
                       .labelStyle(.iconOnly)
            }
        }
        .padding(.top)
        .padding(.bottom)
        /// Exercise 1: Configure the accessibility properties manually
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Rating")
        .accessibilityValue("\(Int(rating)) thumbs-up")
        .accessibilityAdjustableAction({ direction in
            switch direction {
            case .increment:
                if rating < 5 { rating += 1 }
            case .decrement:
                if rating > 0 { rating -= 1 }
            @unknown default: break
            }
        })
        .accessibilityHint("Rates the conference up to five thumbs-up")
/// Exercise 2: Configure the accessibility properties using Accessibilty Representation
//  .accessibilityRepresentation {
//      Slider(value: $rating,
//          in: 0...5,
//          step: 1,
//          label: {
//              Text("Rating")
//          })
//          /// Exercise 2.1: Improve the value
//          // .accessibilityValue("\(Int(rating)) thumbs up")
//      }
    }
}

#Preview {
    RatingView(rating: .constant(3.0))
        .modelContainer(for: Conference.self, inMemory: true)
}
