//
//  TextF.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 10.01.2024.
//

import SwiftUI


struct TextF: View {
    @Binding var cal: String
    var body: some View {
            VStack(alignment: .leading) {
                Text("Your Comment:")
                    .font(.headline)

                ZStack(alignment: .topLeading) {
                    TextEditor(text: $cal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(minHeight: 100) // Adjust the minimum height as needed
                        .padding()

                    Rectangle()
                        .stroke(Color.secondary, lineWidth: 1)
                        .background(Color.clear)
                        .frame(width: 360,height: 500)
                }
            }
            .padding()
        }
}

#Preview {
    TextF(cal: .constant("100"))
}


