//
//  LoginSuccessView.swift
//  MyMovieBook
//
//  Created by Büşra Sude Külek on 9.01.2024.
//

import SwiftUI

struct LoginSuccessView: View {

    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            if let user = viewModel.currentUser {
                VStack {
                    Text(user.initials)
                    Text(user.fullname)
                    Text(user.email)
                    
                    
                    
                    Button {
                        viewModel.signOut()
                    } label: {
                        HStack {
                            HStack {
                                Text("Sign Out")  // Use the provided text variable
                                    .fontWeight(.semibold)
                                    .font(.system(size: 14))
                            }
                            .foregroundColor(.white)
                            
                            .frame(width: 327,height: 56)
                            .background(Color(#colorLiteral(red: 0.2117647059, green: 0.3725490196, blue: 0.2862745098, alpha: 1)))
                            .cornerRadius(12)
                        }
                    }
                    
                    
                }
            }
        }

    }
}

#Preview {
    LoginSuccessView()
        .environmentObject(AuthViewModel())
}
