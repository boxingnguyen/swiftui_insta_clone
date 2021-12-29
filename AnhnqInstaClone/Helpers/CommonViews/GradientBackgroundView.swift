//
//  GradientBackground.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 08/12/2021.
//

import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
//        #colorLiteral()
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.6749124527, green: 0.32035622, blue: 0.8676045537, alpha: 1)), Color(#colorLiteral(red: 0.005852687173, green: 0.4725257754, blue: 0.9950833917, alpha: 1))]),
                       startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .navigationBarHidden(true)
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackgroundView()
    }
}
