//
//  SearchBarView.swift
//  Products-iOS
//
//  Created by Omar on 20/07/2024.
//

import SwiftUI

struct SearchBarView: View {
    //MARK: Properties
    @Binding var text: String
    
    init(text: Binding<String>) {
        self._text = text
    }
    
    var body: some View {
        HStack(spacing: 15){
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.blue)
                
                TextField("what do you search for ?", text: $text)
                    .autocorrectionDisabled()
                    .overlay(alignment: .trailing) {
                        Image(systemName: "xmark.circle.fill")
                            .padding(5)
                            .offset(x: 5, y: 0)
                            .opacity(text.isEmpty ? 0.0 : 1.0)
                            .background()
                            .onTapGesture {
                                text = ""
                                UIApplication.shared.dismissKeyBoard()
                            }
                    }
            }
            .font(.headline)
            .padding()
            .background(
                ZStack{
                    Color.white
                        .cornerRadius(25)
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.blue.opacity(0.8),lineWidth: 1)
                }
            )
            Image(systemName: "cart")
                .font(.system(size: 30))
                .foregroundColor(.blue)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant("asd"))
    }
}
