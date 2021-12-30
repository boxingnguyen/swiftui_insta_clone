//
//  ReelsView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 23/12/2021.
//
// Thank to Kavsoft from https://www.youtube.com/watch?v=Myl21dnEQ40

import Alamofire
import AVFoundation
import SwiftUI

struct MediaFile: Identifiable {
    var id = UUID().uuidString
    var url: String
    var title: String
    var isExpanded: Bool = false
}

let MediaFileJSON = [
    MediaFile(url: "Reel1", title: "Shmeksss Short Video"),
    MediaFile(url: "Reel2", title: "Beautiful girl ....."),
    MediaFile(url: "Reel3", title: "ELANTRA HUYNDAI The He Moi"),
    MediaFile(url: "Reel4", title: "First Air Promotional video....."),
    MediaFile(url: "Reel5", title: "Video TVC Quảng Cáo Chuyên Nghiệp - Độc Đáo......"),
    MediaFile(url: "Reel6", title: "Beautiful girl video 30s triệu view #tabthịnhhành #viral #tiktok #shorts.....")
]

struct ReelsView: View {
    @State var currentReel = ""

    // Extracting Avplayer from media File...
    @State var reels = MediaFileJSON.map { item -> Reel in
        let url = Bundle.main.path(forResource: item.url, ofType: "mp4") ?? ""
        let player = AVPlayer(url: URL(fileURLWithPath: url))

        return Reel(player: player, mediaFile: item)
    }

    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            TabView(selection: $currentReel) {
                ForEach($reels) { $reel in
                    ReelsPlayer(reel: $reel, currentReel: $currentReel)
                        .frame(width: size.width)
                        .rotationEffect(.init(degrees: -90))
                        .ignoresSafeArea(.all, edges: .top)
                        .tag(reel.id)
                }
            }

            // Rotating View
            .rotationEffect(.init(degrees: 90))

            // Since view is rotated setting height as width...
            .frame(width: size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(width: size.width)
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(.black)
        .onAppear {
            currentReel = reels.first?.id ?? ""
        }
    }
}

struct ReelsView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
