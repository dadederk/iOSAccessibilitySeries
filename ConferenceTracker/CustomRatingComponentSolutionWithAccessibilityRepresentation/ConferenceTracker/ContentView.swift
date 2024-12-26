//
//  ContentView.swift
//  ConferenceTracker
//
//  Created by Dani on 17/12/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var showingConferenceAddition = false
    @Query private var conferences: [Conference]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(conferences) { conference in
                    NavigationLink {
                        ConferenceView(conference: conference)
                    } label: {
                        Text(conference.name)
                    }
                }
                .onDelete(perform: deleteConferences)
            }
            .navigationTitle("Conference Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        showingConferenceAddition.toggle()
                    } label: {
                        Label("Add a conference", systemImage: "plus.circle")
                    }
                    .sheet(isPresented: $showingConferenceAddition) {
                        AddConferenceView()
                    }
                }
            }
        } detail: {
            Text("Select a conference")
        }
    }

    private func deleteConferences(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(conferences[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Conference.self, inMemory: true)
}
