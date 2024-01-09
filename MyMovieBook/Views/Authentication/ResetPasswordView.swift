//
//  ResetPasswordView.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 8.01.2024.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            VStack {
                //  image
                Image("MuseU Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 120)
                    .padding(.vertical, 32)

                //  form fields
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                        .autocapitalization(.none)

                }
                .padding(.horizontal)
                .padding(.top)





                //  sign in button
                Button {
                } label: {

                        HStack {
                            Text("SEND RESET LINK")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)

                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)


                Spacer()

                //  sign up botton
                NavigationLink {
                    SignInView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Back to Login")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    ResetPasswordView()
}
