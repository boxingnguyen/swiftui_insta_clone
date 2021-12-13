//
//  SignUp.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 08/12/2021.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var email = ""
    @State private var pasword = ""
    @State private var fullname = ""
    @State private var username = ""

    var body: some View {
        NavigationView {
            GradientBackground()
                .overlay(
                    _body
                )
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }

    var _body: some View {
        VStack {
            Image("plus_photo")
                .renderingMode(.template)
                .foregroundColor(.white)
            Group {
                CommonTextField(hint: "Email", value: email)
                CommonTextField(hint: "Password", value: pasword)
                CommonTextField(hint: "Fullname", value: fullname)
                CommonTextField(hint: "Username", value: username)
            }.padding(.top)
            Button("Sign Up") {
                print("pressed")
            }
            .padding(.top)
            .buttonStyle(BottomButtonStyle())
            Spacer()
            HStack {
                Text("Already have an account?")

                Button(action: {
                    // back to SignIn
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Sign In")
                        .bold()
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
