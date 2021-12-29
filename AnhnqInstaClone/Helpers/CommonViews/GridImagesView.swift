//
//  GridImages.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 29/12/2021.
//

import SwiftUI

struct GridImagesView: View {
    @State var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 5) {
                ForEach(0 ..< 20) { _ in
                    AsyncImageView(url: Constants.randomeImgUrl)
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 120)
                        .shadow(color: Color.primary.opacity(0.3), radius: 1)
//                        .cornerRadius(5)
                }
            }
            .animation(.interactiveSpring(), value: true)
        }
    }
}

struct GridImagesView_Previews: PreviewProvider {
    static var previews: some View {
        GridImagesView()
    }
}
