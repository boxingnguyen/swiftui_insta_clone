//
//  SignInView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 08/12/2021.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var pasword = ""
    @State private var username = ""

    var body: some View {
        NavigationView {
            GradientBackground()
                .overlay(
                    VStack {
                        Image("Instagram_logo_white")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                        Group {
                            CommonTextField(hint: "Email", value: email)
                            CommonTextField(hint: "Password", isSecure: true, value: pasword)
                        }.padding(.top)

                        Button("Log In") {
                            // login and go to home
                            print("pressed")
                        }.padding([.vertical])
                            .buttonStyle(BottomButtonStyle())
                        Spacer()
                            .frame(height: 20)

                        HStack {
                            Text("Forgot your password?").foregroundColor(.white)
                            Button(action: {
                                // goto forgot password
                            }) {
                                Text("Get help signing in.")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer()
                        HStack {
                            Text("Don't have an account?")
                            NavigationLink(destination: SignUpView()) {
                                Text("Sign Up")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }.padding()
                )
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
