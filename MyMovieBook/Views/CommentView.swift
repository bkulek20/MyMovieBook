//
//  CommentView.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 10.01.2024.
//

import SwiftUI



struct CommentView: View {
    @StateObject var viewModel = CommentViewModel()

    var body: some View {
        VStack(){
            TextF(cal: $viewModel.note)
                .padding()
            SaveButton(action: asd)

        }
    }
}
func asd(){

}
#Preview {
    CommentView()
}

