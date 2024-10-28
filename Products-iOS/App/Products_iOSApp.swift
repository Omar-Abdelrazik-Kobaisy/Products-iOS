//
//  Products_iOSApp.swift
//  Products-iOS
//
//  Created by Omar on 17/07/2024.
//

import SwiftUI
import PersistentLayer

@main
struct Products_iOSApp: App {
//    private let persistentController = CoreDataProvider.shared
    var body: some Scene {
        WindowGroup {
            ProductsView()
//                .environment(\.managedObjectContext, persistentController.viewContext)
        }
    }
}
