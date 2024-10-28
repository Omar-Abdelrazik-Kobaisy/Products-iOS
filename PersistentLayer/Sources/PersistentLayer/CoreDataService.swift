//
//  File.swift
//  
//
//  Created by Omar on 27/10/2024.
//

import Foundation
import CoreData

public protocol CoreDataServicesProtocol {
    associatedtype Entity: NSManagedObject
    
    func create(_ object: Entity) throws
    func readAll() throws -> [Entity]
    func deleteAll() throws
}
public class CoreDataServices<Entity: NSManagedObject>: CoreDataServicesProtocol {
    private let context: NSManagedObjectContext
    private let provider: CoreDataProvider
    
    public init(provider: CoreDataProvider) {
        self.context = provider.viewContext
        self.provider = provider
    }

    public func create(_ object: Entity) throws {
        context.insert(object)
        try save()
    }
    
    public func readAll() throws -> [Entity] {
        let fetchRequest = Entity.fetchRequest()
        return try context.fetch(fetchRequest) as! [Entity]
    }
    
    public func deleteAll() throws {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: Entity.self))
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        try context.execute(deleteRequest)
        try save()
    }
    
    
    // MARK: - Save Context
    public func save() throws {
        if context.hasChanges {
            do {
                try context.save()
                print("saved successfully")
            } catch {
                throw CoreDataError.cannotSave("Failed to save context: \(error)")
            }
        }
    }
}
