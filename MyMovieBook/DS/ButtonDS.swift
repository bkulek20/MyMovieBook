//
//  ButtonDS.swift
//  MyMovieBook
//
//  Created by Emre Taşkend on 9.01.2024.
//

import SwiftUI

struct ButtonDS: View {

    private let action: () -> Void
    private let col: Color
    init(
        col: Color,
        action: @escaping () -> Void
    ) {
        self.col = col
        self.action = action
    }

    var body: some View {
        Button(
            action: action
        ) {
            Image(systemName: "heart.fill")
                .foregroundColor(self.col)
        }
    }
}


