//
//  SaveButton.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 10.01.2024.
//

import SwiftUI


struct SaveButton: View {
    private let action: () -> Void
    private let buttonName: String = "Save"
    init(
        action: @escaping () -> Void
    ) {

        self.action = action
    }

    var body: some View {
        Button(
            action: action
        ) {
            Text(buttonName)
                .foregroundStyle(.orange)
                .overlay {
                    RoundedRectangle( cornerRadius: 5)
                        .stroke(.red, lineWidth: 4)
                }
        }
    }
}


