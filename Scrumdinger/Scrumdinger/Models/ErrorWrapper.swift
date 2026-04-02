//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by Freak on 01.04.2026.
//
import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String

    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
