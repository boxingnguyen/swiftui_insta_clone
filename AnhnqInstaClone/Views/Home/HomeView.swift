//
//  HomeView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 23/12/2021.
//

import SwiftUI

struct HomeView: View {
    let _plusIcon = "plus.app"
    let _messageIcon = "message"

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                HStack {
                    ZStack {
                        Image(ImgAssets.instaLogo)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black)
                    }.aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 50, alignment: .leading)
                    Spacer()
                    Image(systemName: _plusIcon)
                        .foregroundColor(.black)
                        .scaleEffect(1.5)
                    Spacer()
                        .frame(width: 20)
                    Image(systemName: _messageIcon)
                        .foregroundColor(.green)
                        .scaleEffect(1.5)
                }
                .padding(.horizontal, 16)
            }.background(.white)

            ScrollView {
                StoryView()

                ForEach(0 ..< 9) { _ in
                    PostView()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
