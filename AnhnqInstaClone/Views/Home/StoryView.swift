//
//  StoryView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 28/12/2021.
//

import SwiftUI

struct StoryView: View {
    private let randomName = ["Boxing", "Andt", "Tupa", "Huypq", "Quangvv", "Haipv", "Huynd", "Ten dai vai loz the deo nao"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< 9) { _ in
                    VStack(alignment: .center) {
                        AsyncImageView(url: Constants.randomeImgUrl)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay {
                                Circle().stroke(
                                    AngularGradient(
                                        gradient: .init(colors: [.pink, .yellow, .orange, .purple, .red]),
                                        center: .center
                                    ), lineWidth: 2
                                )
                            }
                            .shadow(radius: 7)
                            .frame(width: 50, height: 50)

                        Text(randomName.randomElement()!)
                            .frame(width: 69, alignment: .center)
                            .lineLimit(1)
                            .font(.caption)
                    }.background(.white)
                }
            }
            .padding(8)
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
