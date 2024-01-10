//
//  FavViewModel.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 10.01.2024.
//

import Foundation


@MainActor
class FavViewModel: ObservableObject {

    @Published var favArr: [Movie] = []


    init() {
        self.favArr = []
    }

    func addFav() {
        
    }



}


