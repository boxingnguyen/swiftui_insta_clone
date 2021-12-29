//
//  AsyncImageView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 29/12/2021.
//

import SwiftUI

struct AsyncImageView: View {
    var url: String

    var body: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: URL(string: url)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
        } else {
            if let validUrl = URL(string: url) {
                AsyncImageLoader(
                    url: validUrl,
                    placeholder: {
                        ProgressView()
                    },
                    image: {
                        Image(uiImage: $0).resizable()
                    }
                )
            } else {
                Text("Image not available")
                    .font(.body)
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(url: Constants.randomeImgUrl)
    }
}
