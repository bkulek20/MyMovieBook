//
//  FavouritesResults.swift
//  MyMovieBook
//
//  Created by Emre Taşkend on 8.01.2024.
//

import Foundation

struct FavouritesResults: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
