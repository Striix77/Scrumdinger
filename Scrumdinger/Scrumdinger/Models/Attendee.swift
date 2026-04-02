//
//  Attendees.swift
//  Scrumdinger
//
//  Created by Freak on 01.04.2026.
//
import Foundation
import SwiftData

@Model
class Attendee: Identifiable {
    var id : UUID
    var name: String
    var dailyScrum: DailyScrum?
    
    init(id:UUID = UUID(),name: String) {
        self.id = id
        self.name = name
    }
}
