//
//  LoginViewModel.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 14/12/2021.
//

import Combine
import Foundation

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    @Published var isLoginFailed = false
    @Published var isEmailValid = false
    @Published var isPasswordValid = false
    @Published var canSubmit = false
    private var cancellableSet: Set<AnyCancellable> = []

//    private var isLoadingPublisher: AnyPublisher<Bool, Never> {
//        SignInHandler.$isLoading
//            .receive(on: RunLoop.main)
//            .map { $0 }
//            .eraseToAnyPublisher()
//    }

//    private var isAuthenticatedPublisher: AnyPublisher<String, Never> {
//        SignInHandler.$WoofModel
//            .receive(on: RunLoop.main)
//            .map { response in
//                guard let response = response else {
//                    return ""
//                }
//
//                return response.url ?? ""
//            }
//            .eraseToAnyPublisher()
//    }

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
//
//        isLoadingPublisher
//            .receive(on: RunLoop.main)
//            .assign(to: \.isLoading, on: self)
//            .store(in: &disposables)
//
//        isAuthenticatedPublisher
//            .receive(on: RunLoop.main)
//            .assign(to: \.woofUrl, on: self)
//            .store(in: &disposables)
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
            isLoginFailed ?
            "Incorrect email or password!"
            :
            "Must be at least 8 characters, one upper, one lower case letter, one number and one special character"
    }

    func signIn() {
        print("Sign in \(email)")

        // set isLoginFailed
    }
}
