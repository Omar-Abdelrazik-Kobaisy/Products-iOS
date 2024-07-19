//
//  BaseView.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import SwiftUI

struct BaseView<Content: View>: View {
    var content: () -> (Content)
    var body: some View {
        ZStack {
            BaseBackgroundView()
            content()
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView(content: {
            Text("Hello world")
        })
    }
}

struct BaseBackgroundView: View {
    var body: some View {
        Color.gray.opacity(0.15)
            .ignoresSafeArea()
    }
}

