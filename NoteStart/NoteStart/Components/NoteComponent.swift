//
//  NoteComponent.swift
//  NoteStart
//
//  Created by Vitaly Isk
//

import SwiftUI

struct NoteComponent: View {
    var title: String
    var content: String
    var maxContentLength: Int = 10
    @State private var isPressed = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.system(.title3,design: .rounded, weight: .bold))
                
                Text(content.prefix(20))
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        
        .padding(.horizontal, 5)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        // анимация при нажатии
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onTapGesture {
                isPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isPressed = false
                }
            }
    }
    
}

#Preview {
    NoteComponent(title: "Проверка заголовка", content: "Проверка текста")
}
