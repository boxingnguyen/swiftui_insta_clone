//
//  ActivityItemView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 29/12/2021.
//

import SwiftUI

private let randomeCreatedAt = ["2h", "15m", "8h", "6h", "17h", "7m", "3m"]
private let activities = [ActivityType.following, ActivityType.mightKnow, ActivityType.like]

struct ActivityItem: View {
    let randomeActivity = activities.randomElement()!

    var body: some View {
        HStack(alignment: .center) {
            AsyncImageView(url: Constants.randomeImgUrl)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(randomName.randomElement()!)
                .font(.subheadline)
                .bold()
                +
                Text(" " + getContent(type: randomeActivity))
                .font(.footnote)
                +
                Text(" " + randomeCreatedAt.randomElement()!)
                .font(.caption2)
            Spacer()

            switch randomeActivity {
            case ActivityType.following:
                ActivityButton(action: {}, type: ActivityType.following)
            case ActivityType.mightKnow:
                ActivityButton(action: {}, type: ActivityType.mightKnow)
            default:
                AsyncImageView(url: Constants.randomeImgUrl)
                    .frame(width: 40, height: 40)
            }
        }
        .padding(8)
    }

    private func getContent(type: ActivityType) -> String {
        switch randomeActivity {
        case ActivityType.following:
            return "started following you"
        case ActivityType.mightKnow:
            return "who you might know, is on instagram"
        case ActivityType.comment:
            return "mentioned you in a comment"
        default:
            return "and others liked your post"
        }
    }
}

struct ItemActivity_Previews: PreviewProvider {
    static var previews: some View {
        ActivityItem()
    }
}

struct ActivityButton: View {
    var action: () -> Void
    var type: ActivityType

    var body: some View {
        let isFollowing = type == ActivityType.following

        Button(action: action, label: {
            Text(isFollowing ? "Following" : "Follow")
                .frame(width: 80, height: 25)
                .font(.system(size: 15))
                .foregroundColor(isFollowing ? .black : .white)
                .background(isFollowing ? .white : .blue)
                .cornerRadius(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(isFollowing ? Color.gray : Color.blue, lineWidth: 1)
                )
        })
    }
}
