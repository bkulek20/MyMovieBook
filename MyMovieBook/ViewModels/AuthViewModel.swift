//
//  AuthViewModel.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 8.01.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?

    init() {
        self.userSession = Auth.auth().currentUser

        Task {
            await fetchUser()
        }
    }

    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            print(result)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }

    }

    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)

            self.userSession = result.user

            let user = User(id: result.user.uid, fullname: fullname, email: email, favMovies: []) //create our user
            guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser) //upload data to firestore
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }

    func deleteAccount() {

    }

    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        print("fetch çalıştı")

    }
//    func updateFavoriteMovies(forUserId userId: String, withMovies newMovies: [Movie]) async throws {
//        do {
//            // Fetch the current favorite movies
//            let documentRef = Firestore.firestore().collection("users").document(userId)
//            let snapshot = try await documentRef.getDocument()
//            var currentUser = try snapshot.data(as: User.self)
//
//            // Append new movies to the existing ones
//            currentUser.favMovies.append(contentsOf: newMovies)
//
//            // Encode the updated list of movies
//            guard let encodedMovies = try? Firestore.Encoder().encode(currentUser.favMovies) else { return }
//
//            // Update the user's favorite movies in Firestore
//            try await documentRef.updateData(["favMovies": encodedMovies])
//        } catch {
//            print("DEBUG: Failed to update favorite movies with error \(error.localizedDescription)")
//        }
//    }


}

