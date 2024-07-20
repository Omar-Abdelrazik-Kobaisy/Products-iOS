//
//  LoadingIndecator.swift
//  Products-iOS
//
//  Created by Omar on 20/07/2024.
//

import SwiftUI
import SSToastMessage
struct LoadingIndecator: View {
    @State private var isLoading: Bool = false
    var body: some View {
//        VStack(alignment:.center,spacing: 5){
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(.blue,lineWidth: 5.5)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false), value: isLoading)
                .frame(width: 50, height: 50, alignment: .center)
//            Text("Please Wait")
//        }
//        .frame( maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
        .onAppear(perform: {
            isLoading = true
        })
    }
}

extension View{
    func showLoadingIndecator(isLoading: Binding<Bool>) -> some View {
        self
            .overlay(alignment: .center) {
                if isLoading.wrappedValue {
                    LoadingIndecator()
                }
            }
    }
}

struct LoadingIndecator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndecator()
    }
}
