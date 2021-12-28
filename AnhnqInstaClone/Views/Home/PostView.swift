//
//  PostView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 28/12/2021.
//

import SwiftUI

struct PostView: View {
    private let randomName = ["Boxing", "Andt", "Tupa", "Huypq", "Quangvv", "Haipv", "Huynd"].randomElement()!
    private let randomeImgUrl = "https://picsum.photos/200"
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
            AsyncImage(url: URL(string: randomeImgUrl)) { image in
                image.resizable()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .padding(.trailing, 8)
            
            Text(randomName)
            Spacer()
            Image(systemName: moreIcon)
        }
        .padding(8)
    }
    
    private var mediaView: some View {
        AsyncImage(url: URL(string: randomeImgUrl)) { image in
            image.resizable()
                .frame(height: 300)
        } placeholder: {
            ProgressView()
        }
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
        StyledText(verbatim: "\(randomName) \(randomString(length: 20)) \(randomString(length: 10)) \(randomString(length: 80))")
            .style(.bold(), ranges: { [$0.range(of: randomName)] })
            .padding(8)
            .lineLimit(3)
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
