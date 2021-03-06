//
//  SignInView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 08/12/2021.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    @State var activateNavigationLink = false

    var body: some View {
        NavigationView {
            GradientBackgroundView()
                .overlay(
                    _body
                )
                .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }

    var _body: some View {
        VStack {
            Image(ImgAssets.instaLogo)
                .renderingMode(.template)
                .foregroundColor(.white)

            Group {
                CommonTextFieldView(value: $viewModel.email, hint: "Email", errMsg: viewModel.emailMsgErr)
                CommonTextFieldView(value: $viewModel.password, hint: "Password", errMsg: viewModel.passwordMsgErr, isSecure: true)
            }.padding(.top)

            NavigationLink(destination: DashboardView(), isActive: $viewModel.canSubmit) {
                Button("Log In") {
                    // login and go to home
                    viewModel.signIn()
                }.padding([.vertical])
                    .buttonStyle(BottomButtonStyle())
                    .disabled(!viewModel.canSubmit)
                    .opacity(viewModel.canSubmit ? 1 : 0.6)
                    .navigationBarHidden(true)
            }
            .navigationBarHidden(true)

            Spacer()
                .frame(height: 20)
            forgotPass
            Spacer()
            signUp
        }.padding()
            .navigationBarHidden(true)
    }

    private var forgotPass: some View {
        HStack {
            Text("Forgot your password?")
                .foregroundColor(.white)
                .font(.body)
            Button(action: {
                // goto forgot password
            }) {
                Text("Get help signing in.")
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
    }

    private var signUp: some View {
        HStack {
            Text("Don't have an account?")
                .foregroundColor(.white)
                .font(.body)
            NavigationLink(destination: SignUpView()) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
