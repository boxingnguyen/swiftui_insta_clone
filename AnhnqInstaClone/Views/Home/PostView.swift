//
//  PostView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 28/12/2021.
//

import SwiftUI

struct PostView: View {
    private let moreIcon = "ellipsis"
    private let likeIcon = "heart"
    private let commentIcon = "bubble.right"
    private let shareIcon = "paperplane"
    private let bookmarkIcon = "bookmark"
    
    var body: some View {
        VStack(alignment: .leading) {
            titleView
            mediaView
            interactionView
            captionView
        }
    }
    
    private var titleView: some View {
        HStack() {
            AsyncImageView(url: Constants.randomeImgUrl)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .frame(width: 50, height: 50)
            .padding(.trailing, 8)
            
            Text(randomName.randomElement()!)
                .font(.body)
                .bold()
            Spacer()
            Image(systemName: moreIcon)
        }
        .padding(8)
    }
    
    private var mediaView: some View {
        // TODO: display in case video or carousel
        AsyncImageView(url: Constants.randomeImgUrl)
            .frame(height: 300)
    }
    
    private var interactionView : some View {
        // TODO: change icon to .fill after tap to interact
        HStack {
            Image(systemName: likeIcon)
            Image(systemName: commentIcon)
            Image(systemName: shareIcon)
            Spacer()
            Image(systemName: bookmarkIcon)
        }
        .padding(8)
    }
    
    private var captionView : some View {
        StyledText(verbatim: "\(randomName.randomElement()!) \(randomString(length: 20)) \(randomString(length: 10)) \(randomString(length: 50)) \(randomString(length: 80))")
            .style(.bold(), ranges: { [$0.range(of: randomName.randomElement()!)] })
            .padding(8)
            .lineLimit(3)
            .font(.caption)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
