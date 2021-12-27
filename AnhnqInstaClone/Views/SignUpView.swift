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
        ScrollView {
            VStack {
                profileView

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
        }.sheet(isPresented: $viewModel.showingImagePicker, onDismiss: viewModel.loadImage) {
            ImagePicker(pickedImage: $viewModel.pickedImage, showImagePicker: $viewModel.showingImagePicker, imageData: $viewModel.imageData)
        }.actionSheet(isPresented: $viewModel.showingActionSheet) {
            ActionSheet(title: Text("Choose a photo"), buttons: [
                .default(Text("Choose from library")) {
                    viewModel.sourceType = .photoLibrary
                    viewModel.showingImagePicker = true
                },
                .default(Text("Take a photo")) {
                    viewModel.sourceType = .camera
                    viewModel.showingImagePicker = true
                }, .cancel()

            ])
        }
    }

    private var profileView: some View {
        Group {
            if let profileImage = viewModel.profileImage {
                AnyView(profileImage.resizable()
                    .clipShape(Circle())
                    .frame(width: 100, height: 100)
                )
            } else {
                AnyView(Image(ImgAssets.plusPhoto)
                    .renderingMode(.template)
                    .foregroundColor(.white))
            }
        }
        .onTapGesture {
            print("show action")
            viewModel.showingActionSheet = true
        }
    }
}

struct SignUPView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
