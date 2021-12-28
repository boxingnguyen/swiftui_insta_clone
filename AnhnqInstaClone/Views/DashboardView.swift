//
//  DashboardView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 23/12/2021
//

import SwiftUI

struct Dashboard: View {
    @State var tabIndex = 0
    let selectedImages = [ImgAssets.homeSelect, ImgAssets.searchSelect, ImgAssets.reelsSelected, ImgAssets.likeSelect, ImgAssets.profileSelect]
    let unselectedImages = [ImgAssets.homeUnselect, ImgAssets.searchUnselect, ImgAssets.reelsUnselected, ImgAssets.likeUnselect, ImgAssets.profileUnselect]

    var body: some View {
        VStack {
            ZStack {
                switch tabIndex {
                case 1:
                    SearchView()
                case 2:
                    ReelsView()
                case 3:
                    ActivityView()
                case 4:
                    ProfileView()
                    Color.white.edgesIgnoringSafeArea(.top)
                default:
                    HomeView()
                }
            }
            Spacer()

            HStack {
                ForEach(0 ..< 5) { index in
                    Button(action: {
                        self.tabIndex = index
                    }, label: {
                        Spacer()
                        Image(index == tabIndex ? self.selectedImages[index] : self.unselectedImages[index])
                        Spacer()
                    })
                }
            }
            .padding(.all, 8)
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
