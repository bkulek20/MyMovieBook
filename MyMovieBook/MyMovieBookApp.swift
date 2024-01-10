//
//  MyMovieBookApp.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 3.01.2024.
//

import SwiftUI
import Firebase

@main
struct MyMovieBookApp: App {
    @StateObject var viewModel = AuthViewModel()


    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(viewModel)
        }
    }
}
