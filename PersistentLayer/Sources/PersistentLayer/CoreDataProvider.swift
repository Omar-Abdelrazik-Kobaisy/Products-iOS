//
//  CoreDataProvider.swift
//
//
//  Created by Omar AbdElrazek on 27/10/2024.
//

import Foundation
import CoreData
import SwiftUI

final public class CoreDataProvider{
    public static let shared = CoreDataProvider()
    var container: NSPersistentContainer
    
    public init(modelName: String = "Products") {
        container = NSPersistentContainer(name: modelName)
        if EnvironmentValues.isPreview{
            container.persistentStoreDescriptions.first?.url = .init(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    
        public var viewContext: NSManagedObjectContext {
            let context:NSManagedObjectContext = self.container.viewContext
            context.automaticallyMergesChangesFromParent = true
            return context
        }

        public var backgroundContext: NSManagedObjectContext {
//            return container.newBackgroundContext()
            let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            context.persistentStoreCoordinator = container.persistentStoreCoordinator
            return context
        }
    

}

extension EnvironmentValues {
    static var isPreview: Bool {
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}
