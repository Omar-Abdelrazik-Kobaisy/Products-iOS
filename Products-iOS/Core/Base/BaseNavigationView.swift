//
//  BaseNavigationView.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import SwiftUI

struct BaseNavigationView<Content: View>: View {
    var content: () -> (Content)
    var body: some View {
        NavigationView {
            BaseView {
                content()
            }
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}

struct BaseNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BaseNavigationView(content: {
            Text("Hello World")
        })
    }
}
