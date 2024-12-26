//
//  ConferenceAdditionView.swift
//  ProjectTracker
//
//  Created by Dani on 17/12/2024.
//

import SwiftUI
import SwiftData

struct AddConferenceView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var conferenceName = ""
    
    private let conferenceNameLabel = LocalizedStringResource(stringLiteral: "Conference name")
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("\(conferenceNameLabel):")
                        .accessibilityHidden(true)
                    TextField("NYSwifty", text: $conferenceName)
                        .textInputAutocapitalization(.sentences)
                        .accessibilityLabel("\(conferenceNameLabel)")
                    Button {
                        let newConference = Conference(name: conferenceName, rating: 0.0)
                        modelContext.insert(newConference)
                        dismiss()
                    } label: {
                        Text("Add")
                    }
                    
                }
            }
            .navigationTitle("Add Conference")
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
            }
        }
    }
}

#Preview {
    AddConferenceView()
        .modelContainer(for: Conference.self, inMemory: true)
}
