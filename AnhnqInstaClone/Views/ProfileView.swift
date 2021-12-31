//
//  ProfileView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 23/12/2021.
//

import SwiftUI

struct ProfileView: View {
    private let plusAppIcon = "plus.app"
    private let menuIcon = "list.bullet"
    private let gridIcon = "square.grid.3x3.square"
    private let playIcon = "play"
    private let downIcon = "chevron.down"
    private let profileIcon = "person.crop.square"
    private let plusAvatarIcon = "plus.circle.fill"
    private let randomPost = Int.random(in: 1 ..< 1000)
    private let randomFollowers = Int.random(in: 1 ..< 1000)
    private let randomFollowing = Int.random(in: 1 ..< 1000)

    private let username = "boxingnguyen"
    private let fullname = "Nguyễn Quyền Anh"
    private let bioWidth = UIScreen.main.bounds.width / 1.5
    private let sampleBio = "Master yourself - Master the enemy! \nLike Swiming, Guitar, Football and Trekking"

    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        profileInfo
                        Text(fullname)
                            .bold()
                        Text(sampleBio)
                            .frame(width: bioWidth, alignment: .leading)
                        groupButton
                        storyHighlight
                        Divider()
                        groupIcon
                    }
                    .padding(.horizontal, 10)
                    GridImagesView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .foregroundColor(.primary)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Text(username)
                            .font(.title)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Image(systemName: plusAppIcon)
                        Image(ImgAssets.menu)
                            .renderingMode(.template)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }

    private var profileInfo: some View {
        ZStack {
            HStack {
                ZStack {
                    // TODO: investigate frame of avatar can not fit to content
                    Image(ImgAssets.avatar)
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .scaleEffect(0.7)
                    updateAvatarIcon
                }
                Spacer()
                TextColumn(title: "Post", number: randomPost)
                TextColumn(title: "Followers", number: randomFollowers)
                TextColumn(title: "Following", number: randomFollowing)
            }
            .padding(.trailing, 8)
        }
        .background(.gray.opacity(0.3))
    }

    private var updateAvatarIcon: some View {
        Image(systemName: plusAvatarIcon)
            .background(.white)
            .foregroundColor(.blue)
            .font(.system(size: 30))
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                // TODO: update avatar profile
                viewModel.showingActionSheet = true
            }
            .position(x: 110, y: 130)
    }

    private var groupButton: some View {
        HStack {
            Group {
                Button(action: {}) {
                    Text("Edit Profile")
                        .font(.callout)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(8)

                Button(action: {}) {
                    Image(systemName: downIcon)
                        .padding(12.5)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 1)
            )
        }
    }

    private var storyHighlight: some View {
        // TODO: change view as story row if user has story
        HStack {
            Group {
                Text("Story highlights")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Image(systemName: downIcon)
                    .font(.system(size: 10))
            }
            .padding(.vertical, 8)
        }
    }

    private var groupIcon: some View {
        HStack {
            Group {
                Button(action: {}) {
                    Image(systemName: gridIcon)
                }
                Button(action: {}) {
                    Image(systemName: playIcon)
                }
                Button(action: {}) {
                    Image(systemName: profileIcon)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .font(.system(size: 30))
        .padding(.vertical, 8)
    }
}

private struct TextColumn: View {
    var title: String
    var number: Int

    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text("\(number)")
            Text(title)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
    }
}
