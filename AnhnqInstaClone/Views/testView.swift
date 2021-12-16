//
//  testView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 15/12/2021.
//

import Combine
import SwiftUI

struct testView: View {
    @State var text = ""
    @ObservedObject private var viewModel = SignUpViewModel()

    var body: some View {
        TextField("text", text: $viewModel.username)
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
