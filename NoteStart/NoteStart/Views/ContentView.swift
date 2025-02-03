//
//  ContentView.swift
//  NoteStart
//
//  Created by Vitaly Isk
//

import SwiftUI

struct ContentView: View {
    //управления состояния приложения
    @StateObject private var viewModel = NoteStartView.shared
    @State private var showAddSheet: Bool = false
    @State private var noteTitle: String = ""
    @State private var noteContent: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.notes.isEmpty {
                    noteList
                } else {
                    emptyStateView
                }
            }
            .navigationTitle("Мои заметки")
            //добавление кнопки
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    addNoteButton
                }
            }
            //отображает модальное окно для добавления новой заметки
            .sheet(isPresented: $showAddSheet) {
                
              //модальное окно
                SheetView(showAddSheet: $showAddSheet, noteTitle: $noteTitle, noteContent: $noteContent)
            }
        }
    }
    
    private var noteList: some View {
        //отображает список заметок
        List {
            
            //список заметок, используя их уникальный идентификатор
            ForEach(viewModel.notes, id: \.id) { note in
                NavigationLink {
                    NoteView(note: note)
                } label: {
                    //отображение заголовка и содержимого заметки
                    NoteComponent(title: note.title, content: note.content)
                }
            }
            .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            .listRowSeparator(.hidden)
            .buttonStyle(.plain)
        }
        .listStyle(.plain)
    }
    
    private var emptyStateView: some View {
        VStack {
            Image(systemName: "pencil.and.scribble")
                .font(.system(size: 100))
                .foregroundColor(.gray)
                .padding(30)
            
            Text("Нет заметок")
                .foregroundColor(Color.blue)
                .font(.headline)
        }
    }
    
    private var addNoteButton: some View {
        Button {
                showAddSheet = true
        } label: {
            //иконка
            Image(systemName: "plus.circle.fill")
            //настройки размера и пропорций иконки
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80)
                .symbolRenderingMode(.hierarchical)
        }
        .labelStyle(.iconOnly)
    }
}
//предварительный просмотр
#Preview {
    ContentView()
}
