//
//  NoteView.swift
//  NoteStart
//
//  Created by Vitaly Isk
//

import SwiftUI

struct NoteView: View {
    @StateObject private var viewModel = NoteStartView.shared
    @Environment(\.presentationMode) private var presentationMode
    
    var note: Note
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading,spacing: 16) {
                //заголовок
                Text(note.title)
                    .font(.system(.title, design: .rounded, weight: .bold))
                    .foregroundStyle(.primary)
                
                //раздел секции
                Text(note.content)
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.secondary)
                
                HStack {
                    
                    Spacer()
                }
                .padding(.top, 8)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0,y: 4))
            .padding()
        }
        
        .background(Color(.secondarySystemGroupedBackground))
        .navigationTitle(note.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button(role: .destructive) {
                        //удаление заметки
                        viewModel.deleteNote(note.id)
                        
                        //закрытие окружения
                        presentationMode.wrappedValue.dismiss()
                        
                    } label: {
                        Text ("Удалить")
                    }
                    
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
    }
}


#Preview {
    NavigationView {
        NoteView(note: Note(title: "Тест", content: "Тест "))
    }
}
