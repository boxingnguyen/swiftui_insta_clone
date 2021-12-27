//
//  File.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 14/12/2021.
//

import Combine
import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    let didChange = PassthroughSubject<SignUpViewModel, Never>()

    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = "" {
        willSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                while self.username.count > Constants.maxLength {
                    self.username.removeLast()
                }
            }
        }
    }

    @Published var profileImage: Image?
    @Published var pickedImage: Image?
    @Published var showingActionSheet = false
    @Published var showingImagePicker = false
    @Published var imageData = Data()
    @Published var sourceType: UIImagePickerController.SourceType = .photoLibrary

    @Published var isEmailValid = false
    @Published var isPasswordValid = false
    @Published var canSubmit = false

    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        $email.map { email in
            email.isEmpty || Constants.emailPredicate.evaluate(with: email)
        }
        .assign(to: \.isEmailValid, on: self)
        .store(in: &cancellableSet)

        $password.map { password in
            password.isEmpty || Constants.passwordPredicate.evaluate(with: password)
        }
        .assign(to: \.isPasswordValid, on: self)
        .store(in: &cancellableSet)

        Publishers.CombineLatest($isEmailValid, $isPasswordValid)
            .map { isEmailValid, isPasswordValid in
                isEmailValid && isPasswordValid && !self.email.isEmpty
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellableSet)
    }

    var emailMsgErr: String {
        isEmailValid ?
            ""
            :
            "Enter a valid email address!"
    }

    var passwordMsgErr: String {
        isPasswordValid ?
            ""
            :
            "Must be at least 8 characters, one upper, one lower case letter, one number and one special character"
    }

    func signUp() {
        print("Sign in \(email)")
    }

    func loadImage() {
        guard let inputImage = pickedImage else {
            return
        }
        profileImage = inputImage
    }
}
