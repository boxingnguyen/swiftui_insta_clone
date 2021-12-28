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
        VStack {
            HStack(spacing: 16) {
                Image(ImgAssets.instaLogo)
                    .renderingMode(.template)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: _plusIcon)
                    .foregroundColor(.black)
                Image(systemName: _messageIcon)
                    .foregroundColor(.green)
            }
            .padding(.horizontal, 16)
            ScrollView {
                //                    StoryHomeView(data: homeState.data, isSelected: homeState.isSelectedStory)
                Divider()
                //                    ListDataHomeView()
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
