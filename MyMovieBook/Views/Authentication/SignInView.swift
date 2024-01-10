//
//  SignInView.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 8.01.2024.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel


    var body: some View {
        NavigationStack {


                VStack(spacing: 24) {
                    NavigationLink(destination: WelcomeView()
                        .navigationBarBackButtonHidden(true)) {
                                Image("back_icon")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.blue)  // Set the desired icon color
                                    .padding(.trailing,350)
                            }
                    Text("Hi! Welcome Back")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .frame(width: 700, height: 36)
                        .padding(.trailing,160)

                    Text("Log in to your account")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .frame(width: 500, height: 20)
                        .padding(.trailing,210)
                        .foregroundColor(Color(#colorLiteral(red: 0.5803921569, green: 0.6392156863, blue: 0.7215686275, alpha: 1)))



                    HStack {
                        Image("email_icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading,25)
                        InputView(text: $email,
                                  title: "",
                                  placeholder: "Email")
                            .autocapitalization(.none)
                            .font(.system(size: 14))
                            .frame(width: 300,height: 45)
                            .multilineTextAlignment(.leading)
                            .padding(.vertical,-35)
                        Spacer()
                    }
                    .padding()

                    .frame(width: 327,height: 45)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(#colorLiteral(red: 0.8862745098, green: 0.9098039216, blue: 0.9411764706, alpha: 1)), lineWidth: 1)
                    )

                    HStack {
                        Image("password_icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading,25)
                        InputView(text: $password,
                                  title: "",
                                  placeholder: "Password",
                                  isSecureField: true)
                            .autocapitalization(.none)
                            .font(.system(size: 14))
                            .frame(width: 300,height: 45)
                            .multilineTextAlignment(.leading)
                            .padding(.vertical,-35)
                        Spacer()
                    }
                    .padding()

                    .frame(width: 327,height: 45)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(#colorLiteral(red: 0.8862745098, green: 0.9098039216, blue: 0.9411764706, alpha: 1)), lineWidth: 1)
                    )
                    //  password reset botton
                    NavigationLink {
                        ResetPasswordView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack(spacing: 3) {
                            Spacer() // Push to the right
                            Text("Forgot Password?")
                                .fontWeight(.bold)
                                .foregroundColor(Color(#colorLiteral(red: 0.2117647059, green: 0.3725490196, blue: 0.2862745098, alpha: 1)))
                        }
                        .font(.system(size: 14))
                    }

                }
                .padding(.horizontal)
                .padding(.top)
                .padding(.vertical,35)




                //  sign in button

//                MyButton(text: "Log In", destination: SignInView())
            Button {
                Task {
                    try await viewModel.signIn(withEmail: email, password: password)
                }
            } label: {
                HStack {
                    HStack {
                        Text("Sign In")  // Use the provided text variable
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                    }
                    .foregroundColor(.white)

                    .frame(width: 327,height: 56)
                    .background(Color(#colorLiteral(red: 0.2117647059, green: 0.3725490196, blue: 0.2862745098, alpha: 1)))
                    .cornerRadius(12)
                }
            }
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0: 0.5)



                HStack {
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.8862745098, green: 0.9098039216, blue: 0.9411764706, alpha: 1)))
                        .frame(width: 138,height: 1)
                        .cornerRadius(10.5)

                    Text(" Or ")
                        .foregroundColor(Color(#colorLiteral(red: 0.5803921569, green: 0.6392156863, blue: 0.7215686275, alpha: 1)))
                        .font(.system(size: 14))

                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.8862745098, green: 0.9098039216, blue: 0.9411764706, alpha: 1)))
                        .frame(width: 138,height: 1)
                        .cornerRadius(10.5)
                }
                .padding(.vertical,35)


//                Button(action: {
//                    // Your action code here
//                }) {
//                    NavigationLink (destination: LoginView() .navigationBarBackButtonHidden(true)) {
//                        HStack {
//                            Image("google_icon")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 24,height: 24)
//                            Text("Continue with Google")  // Use the provided text variable
//                                .fontWeight(.semibold)
//                                .font(.system(size: 14))
//                        }
//                        .foregroundColor(.black)
//                        .frame(width: 327,height: 56)
//                        .background(Color.white)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 12)
//                                .stroke(Color.black, lineWidth: 1)
//                        )
//                    }
//                }
                .padding()

//                Button(action: {
//                    // Your action code here
//                }) {
//                    NavigationLink (destination: LoginView() .navigationBarBackButtonHidden(true)) {
//                        HStack {
//                            Image("apple_icon")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 24,height: 24)
//                            Text("Continue with Apple")  // Use the provided text variable
//                                .fontWeight(.semibold)
//                                .font(.system(size: 14))
//                        }
//                        .foregroundColor(.black)
//                        .frame(width: 327,height: 56)
//                        .background(Color.white)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 12)
//                                .stroke(Color.black, lineWidth: 1)
//                        )
//                    }
//                }
Spacer()


                //  sign up botton
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
                    .foregroundColor(Color.blue)
                }
            }

    }
}

extension SignInView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    SignInView()
        .environmentObject(AuthViewModel())
}
