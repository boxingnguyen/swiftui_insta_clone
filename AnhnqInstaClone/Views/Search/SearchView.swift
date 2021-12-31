//
//  SearchView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 23/12/2021.
//

import SwiftUI

struct SearchView: View {
    let array = ["Peter", "Paul", "Mary", "Anna-Lena", "George", "John", "Greg", "Thomas", "Robert", "Bernie", "Mike", "Benno", "Hugo", "Miles", "Michael", "Mikel", "Tim", "Tom", "Lottie", "Lorrie", "Barbara"]
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false

    var body: some View {
        VStack {
            HStack {
                searchIconAndPlaceholder
                    .background(.gray.opacity(0.3))
                    .cornerRadius(10.0)

                if showCancelButton {
                    cancelButton
                }
            }
            .padding(.horizontal, 8)

            GridImagesView()
                .padding(.top, 8)
        }
    }

    private var searchIconAndPlaceholder: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("search", text: $searchText, onEditingChanged: { _ in
                self.showCancelButton = true
            }, onCommit: {
                print("onCommit")
            })
            .frame(maxWidth: .infinity)

            Button(action: {
                self.searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
    }

    private var cancelButton: some View {
        Button("Cancel") {
            UIApplication.shared.endEditing(true) // this must be placed before the other commands here
            self.searchText = ""
            self.showCancelButton = false
        }
        .foregroundColor(.primary)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInView()
                .environment(\.colorScheme, .light)
//
//            SearchView()
//                .environment(\.colorScheme, .dark)
        }
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        windows
            .filter { $0.isKeyWindow }
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged { _ in
        UIApplication.shared.endEditing(true)
    }

    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
