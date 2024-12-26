//
//  Conference.swift
//  ProjectTracker
//
//  Created by Dani on 17/12/2024.
//

import Foundation
import SwiftData

@Model
final class Conference {
    var name: String
    var rating: Double
    
    init(name: String, rating: Double) {
        self.name = name
        self.rating = rating
    }
}
