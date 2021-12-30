//
//  ReelsPlayer.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 30/12/2021.
//

import SwiftUI

struct ReelsPlayer: View {
    @Binding var reel: Reel
    @Binding var currentReel: String

    @State var showMore = false
    @State var isMuted = false
    @State var volumeAnimation = false

    private let randomUsername = randomName.randomElement()!
    private let randomLike = Int.random(in: 1 ..< 1000)
    private let randomComment = Int.random(in: 1 ..< 1000)
    private let randomShare = Int.random(in: 1 ..< 100)
    private let randomPeople = Int.random(in: 1 ..< 100)

    var body: some View {
        ZStack {
            if let player = reel.player {
                CustomVideoPlayer(player: player)

                // Playing video based on offset height
                GeometryReader { proxy -> Color in
                    let minY = proxy.frame(in: .global).minY
                    let halfOfHeight = proxy.size.height / 2

                    DispatchQueue.main.async {
                        if -minY < halfOfHeight && minY < halfOfHeight
                            && currentReel == reel.id
                        {
                            player.play()
                        } else {
                            player.pause()
                        }
                    }

                    return .clear
                }
                // Volume control
                Color.black.opacity(0.01)
                    .frame(width: .infinity, height: .infinity)
                    .onTapGesture {
                        if volumeAnimation {
                            return
                        }
                        isMuted.toggle()

                        // Muting player
                        player.isMuted = isMuted

                        withAnimation {
                            volumeAnimation.toggle()
                        }

                        // Closing animation after 0.8s
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation {
                                volumeAnimation.toggle()
                            }
                        }
                    }

                // dismiss show more
                Color.black.opacity(showMore ? 0.35 : 0)
                    .onTapGesture {
                        withAnimation {
                            showMore.toggle()
                        }
                    }

                VStack {
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading, spacing: 10) {
                            ownerInfoView
                            titleView
                        }
                        Spacer(minLength: 20)
                        actionButtons
                    }
                    musicView
                }
                .padding()
                .frame(maxHeight: .infinity, alignment: .bottom)
                .foregroundColor(.white)

                Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(.secondary)
                    .clipShape(Circle())
                    .foregroundStyle(.black)
                    .opacity(volumeAnimation ? 1 : 0)
            }
        }
        .onDisappear {
            reel.player?.pause()
        }
    }

    private var ownerInfoView: some View {
        HStack(spacing: 15) {
            Group {
                AsyncImageView(url: Constants.randomeImgUrl)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                Text(randomUsername)
                    .font(.callout.bold())
            }
            .onTapGesture {
                // TODO: show owner reel profile
            }

            Button {} label: {
                Text("Follow")
                    .font(.callout.bold())
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.white, lineWidth: 1)
                    )
            }
        }
    }

    @ViewBuilder
    private var titleView: some View {
        if showMore {
            ScrollView(.vertical, showsIndicators: false) {
                Text(reel.mediaFile.title + randomString(length: 20))
                    .font(.callout)
                    .fontWeight(.semibold)
            }
            .frame(height: 120)
            .onTapGesture {
                withAnimation {
                    showMore.toggle()
                }
            }
        } else {
            Button {
                withAnimation {
                    showMore.toggle()
                }
            } label: {
                Text(reel.mediaFile.title + "...")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .lineLimit(1)

                    .padding(.top, 6)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    private var musicView: some View {
        HStack {
            Image(systemName: "music.note")
                .foregroundColor(.white)
            // TODO: slide
            Text("Original Audio...")
                .font(.caption)
                .fontWeight(.semibold)
            Spacer()
                .frame(width: 5)
            Image(systemName: "person.fill")
                .foregroundColor(.white)
            Text("\(randomPeople) People")
                .font(.callout)
                .fontWeight(.semibold)
            Spacer(minLength: 20)
            AsyncImageView(url: Constants.randomeImgUrl)
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .cornerRadius(5)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.white, lineWidth: 3)
                )
        }
    }

    private var actionButtons: some View {
        VStack(spacing: 25) {
            Button {} label: {
                VStack(spacing: 10) {
                    Image(systemName: "suit.heart")
                    Text("\(randomLike) K")
                        .font(.caption.bold())
                }
            }
            Button {} label: {
                VStack(spacing: 10) {
                    Image(systemName: "bubble.right")
                    Text("\(randomComment)")
                        .font(.caption.bold())
                }
            }
            Button {} label: {
                VStack(spacing: 10) {
                    Image(systemName: "paperplane")
                    Text("\(randomShare)")
                        .font(.caption.bold())
                }
            }

            Button {} label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
        }
    }
}
