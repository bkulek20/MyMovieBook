//
//  FavoritesResults.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 10.01.2024.
//

import Foundation

struct FavouritesResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
