//
//  ImagePicker.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 27/12/2021.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var pickedImage: Image?
    @Binding var showImagePicker: Bool
    @Binding var imageData: Data
        
    func makeCoordinator() -> ImagePicker.Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker?
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            let uiImage = info[.editedImage] as? UIImage
            
            guard let _uiImage = uiImage else {
                return
            }
            parent?.pickedImage = Image(uiImage: _uiImage)
            
            if let mediaData = _uiImage.jpegData(compressionQuality: 0.5) {
                parent?.imageData = mediaData
            }
            parent?.showImagePicker = false
        }
    }
}
