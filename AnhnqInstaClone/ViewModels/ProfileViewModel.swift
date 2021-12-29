//
//  ProfileViewModel.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 29/12/2021.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var profileImage: Image?
    @Published var pickedImage: Image?
    @Published var showingActionSheet = false
    @Published var showingImagePicker = false
    @Published var imageData = Data()
    @Published var sourceType: UIImagePickerController.SourceType = .photoLibrary

    func loadImage() {
        guard let inputImage = pickedImage else {
            return
        }
        profileImage = inputImage
    }
}
