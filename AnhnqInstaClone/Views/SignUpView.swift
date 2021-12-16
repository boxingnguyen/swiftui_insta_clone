//
//  SignUp.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 08/12/2021.
//

import Combine
import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = SignUpViewModel()

    var body: some View {
        NavigationView {
            GradientBackground()
                .overlay(
                    _body
                )
        }.navigationBarHidden(true)
    }

    var _body: some View {
        VStack {
            Image(ImgAssets.plusPhoto)
                .renderingMode(.template)
                .foregroundColor(.white)
            Group {
                CommonTextField(value: $viewModel.email, hint: "Email", errMsg: viewModel.emailMsgErr)
                CommonTextField(value: $viewModel.password, hint: "Password", errMsg: viewModel.passwordMsgErr)
                CommonTextField(value: $viewModel.fullname, hint: "Fullname")
                CommonTextField(value: $viewModel.username, hint: "Username")
            }.padding(.top)
            Button("Sign Up") {
                print("pressed")
            }
            .padding(.top)
            .buttonStyle(BottomButtonStyle())
            .disabled(!viewModel.canSubmit)
            .opacity(viewModel.canSubmit ? 1 : 0.6)
            Spacer()
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.white)
                    .font(.body)

                Button(action: {
                    // back to SignIn
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }

        }.padding()
    }
}

struct SignUPView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
