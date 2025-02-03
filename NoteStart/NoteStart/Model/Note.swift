//
//  Note.swift
//  NoteStart
//
//  Created by Vitaly Isk
//

import Foundation

struct Note: Identifiable {
  
    let id = UUID()
    var title:String
    var content: String
}
