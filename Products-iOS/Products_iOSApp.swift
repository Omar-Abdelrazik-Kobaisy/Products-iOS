//
//  Products_iOSApp.swift
//  Products-iOS
//
//  Created by Omar on 17/07/2024.
//

import SwiftUI

@main
struct Products_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
