//
//  SignUpView.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 8.01.2024.
//

import SwiftUI

struct SignUpView: View {

    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
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
                    Text("Create Account")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .frame(width: 700, height: 36)
                        .padding(.trailing,200)

                    Text("Sign up and get started")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .frame(width: 500, height: 20)
                        .padding(.trailing,210)
                        .foregroundColor(Color(#colorLiteral(red: 0.5803921569, green: 0.6392156863, blue: 0.7215686275, alpha: 1)))


                    HStack {
                        Image("username_icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading,25)
                        InputView(text: $username,
                                  title: "",
                                  placeholder: "Enter your name")
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
                        Image("email_icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading,25)
                        InputView(text: $email,
                                  title: "",
                                  placeholder: "Enter your e-mail")
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
                                  placeholder: "Enter your password",
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
                    
                    HStack {
                        Image("password_icon")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.leading,25)
                        ZStack(alignment: .trailing) {
                            InputView(text: $confirmPassword,
                                      title: "",
                                      placeholder: "Confirm your password",
                                      isSecureField: true)
                            .autocapitalization(.none)
                            .font(.system(size: 14))
                            .frame(width: 300,height: 45)
                            .multilineTextAlignment(.leading)
                            .padding(.vertical,-35)
                            if !password.isEmpty && !confirmPassword.isEmpty {
                                if password == confirmPassword {
                                    Image(systemName: "checkmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemGreen))
                                } else {
                                    Image(systemName: "xmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemRed))
                                }
                            }
                        }


                        Spacer()
                    }


                    .padding()

                    .frame(width: 327,height: 45)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(#colorLiteral(red: 0.8862745098, green: 0.9098039216, blue: 0.9411764706, alpha: 1)), lineWidth: 1)
                    )


                }
                .padding(.horizontal)
                .padding(.top)
                .padding(.vertical,35)




                //  sign up button

            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, password: password, fullname: username)
                }
            } label: {
                HStack {
                    HStack {
                        Text("Sign Up")  // Use the provided text variable
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
                .padding(.vertical,16)

                Spacer()



                NavigationLink {
                    SignInView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                            .foregroundColor(Color(#colorLiteral(red: 0.5803921569, green: 0.6392156863, blue: 0.7215686275, alpha: 1)))
                        Text("Sign In")
                            .fontWeight(.bold)

                    }
                    .font(.system(size: 14))
                    .foregroundColor(Color.blue)
                }
            }

    }
}

extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !username.isEmpty
    }
}

#Preview {
    SignUpView()
}
