//
//  ToastView.swift
//  Products-iOS
//
//  Created by Omar on 20/07/2024.
//

import SwiftUI
import SSToastMessage
struct ToastView: View {
    let message: String
    let fontColor: Color
    let image: String
    let backgroundColor: Color
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            Spacer()
            HStack() {
                Image(systemName: image)//"checkmark.circle"
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .frame(width: 50, height: 50)
                Text(message)
                    .foregroundColor(fontColor)
                    .fontWeight(.bold)
                Spacer()
                
                
            }.padding(15)
        }
        .frame(height: 110)
        .background(backgroundColor)
        .opacity(isPresented ? 1 : 0)
    }
}

extension View{
    func showConnectionToast(isPresented: Binding<Bool>,
                             errorMessage: String,
                             onConnectionRestore: @escaping () -> ()) -> some View{
        self.present(isPresented: isPresented,type: .toast,position: .top) {
            ToastView(message: errorMessage,fontColor: .black, image: "wifi.slash",backgroundColor: .yellow, isPresented: isPresented)
                .onChange(of: errorMessage) { errorMessage in
                    if errorMessage.isEmpty{
                        onConnectionRestore()
                    }
                }
        }
    }
    func showSuccessToast(isPresented: Binding<Bool>,
                             successMessage: String) -> some View{
        self.present(isPresented: isPresented,type: .toast,position: .top) {
            ToastView(message: successMessage,fontColor: .white, image: "checkmark.circle",backgroundColor: .green, isPresented: isPresented)
        }
    }
    func showErrorToast(isPresented: Binding<Bool>,
                             errorMessage: String) -> some View{
        self.present(isPresented: isPresented,type: .toast,position: .top) {
            ToastView(message: errorMessage,fontColor: .white, image: "xmark.circle",backgroundColor: .red, isPresented: isPresented)
        }
    }
}

struct SuccessToastView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            ToastView(message: "success",fontColor: .white, image: "checkmark.circle",backgroundColor: .green, isPresented: .constant(true))
            ToastView(message: "check network connection",fontColor: .black, image: "wifi.slash",backgroundColor: .yellow, isPresented: .constant(true))
            ToastView(message: "error",fontColor: .white, image: "xmark.circle",backgroundColor: .red, isPresented: .constant(true))
        }
    }
}
