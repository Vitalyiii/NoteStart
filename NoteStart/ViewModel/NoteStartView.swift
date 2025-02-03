//
//  NoteStartView.swift
//  NoteStart
//
//  Created by Vitaly Isk
//

import Foundation

final class NoteStartView: ObservableObject {
    static let shared = NoteStartView()
    
        //место хранения
    @Published var notes: [Note] = []
    
    @MainActor
    func addNote(title: String, content: String) {
        let newNote = Note(title: title, content: content)
        notes.append(newNote)
    }
    
    @MainActor
    func deleteNote(_ noteId: UUID) {
        notes.removeAll { $0.id == noteId }
    }
}


