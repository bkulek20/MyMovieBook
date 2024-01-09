//
//  MyButton.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 8.01.2024.
//

import SwiftUI

struct MyButton<Destination: View>: View {
    private let text: String
    private let destination: Destination
    

    init(text: String, destination: Destination) {
        self.text = text
        self.destination = destination
    }

    var body: some View {
        Button(action: {
            // Your action code here
        }) {
            NavigationLink(destination: destination.navigationBarBackButtonHidden(true)) {
                //title koyalım
                HStack {
                    Text(text)  // Use the provided text variable
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                }
                .foregroundColor(.white)

                .frame(width: 327,height: 56)
                .background(Color(#colorLiteral(red: 0.2117647059, green: 0.3725490196, blue: 0.2862745098, alpha: 1)))
                .cornerRadius(12)
            }
        }
    }
}

#Preview {
    MyButton(text: "Test", destination: WelcomeView())
}
