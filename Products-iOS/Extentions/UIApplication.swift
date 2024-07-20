//
//  UIApplication.swift
//  Products-iOS
//
//  Created by Omar on 20/07/2024.
//

import Foundation
import SwiftUI

extension UIApplication{
    
    func dismissKeyBoard(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
