//
//  MovieCardViewVertical.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 10.01.2024.
//

import Foundation
import SwiftUI

struct MovieCardViewVertical: View {

    let trendingItem: Movie
    @State var col: Color = .white
    @EnvironmentObject var viewModel: AuthViewModel


    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: trendingItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 240)
            } placeholder: {
                Rectangle().fill(Color(red:61/255,green:61/255,blue:88/255))
                        .frame(width: 100, height: 240)
            }

            VStack {
                HStack {
                    Text(trendingItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    ButtonDS(col: self.col, action: { self.likeFilm(movie: trendingItem) })
                }
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text(String(format: "%.1f", trendingItem.vote_average))
                    Spacer()
                }
                .foregroundColor(.yellow)
                .fontWeight(.heavy)
            }
            .padding()
            .background(Color(red:61/255,green:61/255,blue:88/255))
        }
        .cornerRadius(10)
    }
    func likeFilm(movie: Movie){
        if let userId = viewModel.currentUser?.id {
            Task {
                try await viewModel.updateFavoriteMovies(forUserId: userId, withMovies: movie)
            }
        } else {
            print("User ID is nil")
        }
    }

}
