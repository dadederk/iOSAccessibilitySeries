//
//  RatingView.swift
//  ConferenceTracker
//
//  Created by Dani on 17/12/2024.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Double
    
    private var onEditingChanged: (() -> Void)?
    
    init(rating: Binding<Double>, onEditingChanged: (()-> Void)? = nil) {
        self._rating = rating
        self.onEditingChanged = onEditingChanged
    }
    
    var body: some View {
        HStack {
            /// Exercise: Create the custom rating component
            ForEach(0..<5) { index in
                let imageName = index < Int(rating) ? "hand.thumbsup.fill" : "hand.thumbsup"
                Button("Thumbs up",
                       systemImage: imageName) {
                    rating = Double(index + 1)
                }
                       .labelStyle(.iconOnly)
            }
        }
        .onChange(of: rating, { oldValue, newValue in
            onEditingChanged?()
        })
        .padding(.top)
        .padding(.bottom)
        /// Exercise: Configure the accessibility properties manually
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Rating")
        .accessibilityValue("\(Int(rating)) thumbs-up")
        .accessibilityAdjustableAction({ direction in
            switch direction {
            case .increment:
                if rating < 5 { rating += 1 }
            case .decrement:
                if rating > 0 { onEditingChanged?() }
            @unknown default: break
            }
        })
        .accessibilityHint("Rates the conference up to five thumbs-up")
    }
}

#Preview {
    RatingView(rating: .constant(3.0))
        .modelContainer(for: Conference.self, inMemory: true)
}
