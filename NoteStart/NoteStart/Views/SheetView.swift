//
//  SheetView.swift
//  NoteStart
//
//  Created by Vitaly Isk
//

import SwiftUI

struct SheetView: View {
    @Binding var showAddSheet: Bool
    @Binding var noteTitle: String
    @Binding var noteContent: String
    
    @ObservedObject private var viewModel = NoteStartView.shared
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                VStack(alignment: .leading) {
                    Text("Заголовок")
                        .font(.headline)
                    
                    TextField(text:$noteTitle) {
                        Text("Напишите текст")
                    }
                        .textFieldStyle(.roundedBorder)
                }
                
                VStack(alignment: .leading) {
                    Text("Текст")
                        .font(.headline)
                    
                    TextField(text:$noteContent) {
                        Text("Напишите текст")
                    }
                        .textFieldStyle(.roundedBorder)
                }
                
                Button {
                    withAnimation(.easeInOut) {
                        viewModel.addNote(title: noteTitle, content: noteContent)
                        
                        //очистка текста
                        noteTitle = ""
                        noteContent = ""
                        
                        //закрытие окна
                        showAddSheet = false
                    }
                } label: {
                    Text("Добавить")
                        .padding(5)
                }
                .buttonStyle(.bordered)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Мои заметки")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SheetView(showAddSheet: .constant(true), noteTitle: .constant("Тест"), noteContent: .constant("Тест"))
}

