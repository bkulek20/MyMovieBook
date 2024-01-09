//
//  ContentView.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 3.01.2024.
//

import SwiftUI

struct WelcomeView: View {

    @EnvironmentObject var viewModel: AuthViewModel


    var body: some View {

        Group {
            if viewModel.userSession != nil {
                LoginSuccessView()
            } else {
                NavigationStack {
                    VStack {
                        Image("onboarding_light")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 375, height: 300)
                            .padding(.horizontal)

                        Text("Let's Get Started")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0x10 / 255.0, green: 0x15 / 255.0, blue: 0x20 / 255.0)) // Text color
                            .multilineTextAlignment(.center) // Center alignment
                            .lineSpacing(12)

                        Text("Sign up or log in to the new movie notebook.")
                            .font(.custom("Inter", size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0x94 / 255.0, green: 0xA3 / 255.0, blue: 0xB8 / 255.0)) // Text color, converted from #94A3B8
                            .lineSpacing(6)
                            .multilineTextAlignment(.center)
                            .padding()

                        MyButton(text: "Sign In", destination: SignInView())

                        Spacer()

                        NavigationLink {
                            SignUpView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            HStack(spacing: 3) {
                                Text("Don't have an account?")
                                    .foregroundColor(Color(#colorLiteral(red: 0.5803921569, green: 0.6392156863, blue: 0.7215686275, alpha: 1)))
                                Text("Sign up")
                                    .fontWeight(.bold)
                            }
                            .font(.system(size: 14))
                            .padding(.bottom)
                        }

                        .foregroundColor(Color.blue)

                    }

                }
            }

        }




    }
}

#Preview {
    WelcomeView()
        .environmentObject(AuthViewModel())
}

