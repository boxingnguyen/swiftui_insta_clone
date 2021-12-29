//
//  ProfileView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 23/12/2021.
//

import SwiftUI

struct ProfileView: View {
    private let plusIcon = "plus.app"
    private let menuIcon = "list.bullet"
    private let gridIcon = "square.grid.3x3.square"
    private let filmIcon = "film"
    private let profileIcon = "person.crop.circle"
    private let username = "Boxing Nguyen"
    private let fullname = "Nguyễn Quyền Anh"

    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Text(username)
                    .font(.headline)
                Spacer()
                Image(systemName: plusIcon)
                Image(systemName: menuIcon)
            }
            .padding(.horizontal, 16)

            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        ZStack {
                            HStack {
                                Image(ImgAssets.avatar)
                                    .resizable()
                                    .clipShape(Circle())
                                    .aspectRatio(contentMode: .fit)
                                    .scaleEffect(0.9)
                                Spacer()
                                TextColumn(title: "Post", number: 100)
                                TextColumn(title: "Followers", number: 50)
                                TextColumn(title: "Following", number: 1000)
                            }
//                            .frame(height: 200)
                            .shadow(radius: 7)

                            Image(systemName: "plus.circle.fill")
                                .background(.white)
                                .foregroundColor(.blue)
                                .font(.system(size: 30))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .onTapGesture {
                                    // TODO: update avatar profile
                                    viewModel.showingActionSheet = true
                                }
                                .position(x: 100, y: 130)
                        }.background(.gray)

                        Text(fullname)
                            .bold()
                        Text("Master yourself - Master the enemy! \nLike Swiming, Guitar, Football and Trekking")
                            .frame(width: UIScreen.main.bounds.width / 1.5, alignment: .leading)
                        Spacer()

                        HStack {
                            Group {
                                Button(action: {}) {
                                    Text("Edit Profile")
                                        .font(.body)
                                        .padding()
                                }

                                Button(action: {}) {
                                    Text("Saved")
                                        .font(.body)
                                        .padding()
                                }
                            }
                            .border(.gray, width: 2)
                            .cornerRadius(5)
                            .padding(.horizontal, 10)
                        }
                    }
                    .padding(.horizontal, 8)

                    HStack {
                        Group {
                            Button(action: {}) {
                                Image(systemName: gridIcon)
                                    .foregroundColor(.black)
                            }
                            Button(action: {}) {
                                Image(systemName: filmIcon)
                                    .foregroundColor(.black)
                            }
                            Button(action: {}) {
                                Image(systemName: profileIcon)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .frame(width: .infinity, height: 50, alignment: .center)
                    .background(.red)
                    GridImagesView()
                }
            }
        }
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
        .padding(.trailing, 10)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
