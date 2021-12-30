//
//  ActivityView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 23/12/2021.
//

import SwiftUI

struct ActivityView: View {
    @StateObject private var viewModel = ActivityViewModel()
    private let navBarTitle = "Activity"

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(0 ..< 20) { _ in
                        ActivityItem()
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(navBarTitle).font(.headline)
                }
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
            .preferredColorScheme(.dark)
    }
}
