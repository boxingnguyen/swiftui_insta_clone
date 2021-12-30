//
//  DashboardView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 23/12/2021
//

import SwiftUI

struct DashboardView: View {
    @State var selection = 0
    let selectedImages = [ImgAssets.homeSelect, ImgAssets.searchSelect, ImgAssets.reelsSelected, ImgAssets.likeSelect, ImgAssets.profileSelect]
    let unselectedImages = [ImgAssets.homeUnselect, ImgAssets.searchUnselect, ImgAssets.reelsUnselected, ImgAssets.likeUnselect, ImgAssets.profileUnselect]

    var body: some View {
        TabView(selection: $selection) {
            ForEach(0 ..< 5) { index in
                NavigationView {
                    Group {
                        switch index {
                            case 1:
                                SearchView()
                            case 2:
                                ReelsView()
                            case 3:
                                ActivityView()
                            case 4:
                                ProfileView()
                            default:
                                HomeView()
                        }
                    }.navigationBarHidden(true)
                }
                .tabItem {
                    // TODO: change reel icon when current tab is reel
                    selection == index ? Image(selectedImages[index]) : Image(unselectedImages[index])
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
