//
//  CoreDataManger.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
import CoreData
enum Entity: String {
    case post
}

final class CoreDataManager: NSObject {
    
    //MARK:- PROPERTIES
    static let shared = CoreDataManager()
    private let modelName: String = "InstgramiOSMimic"
    
    //MARK:- INIT
    private override init() {}
    
    //MARK:- CORE DATA STACK
    lazy var privateContext: NSManagedObjectContext = {
        let context = persistentContainer.newBackgroundContext()
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        context.undoManager = nil
        return context
    }()
    
    lazy var mainManagedObjectContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    //MARK:- PERSISTENT CONTAINER
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        let fileManager = FileManager.default
        let storeName = "\(self.modelName).sqlite"
        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)
        let description = NSPersistentStoreDescription(url: persistentStoreURL)
        
        description.shouldInferMappingModelAutomatically = true
        description.shouldMigrateStoreAutomatically = true
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}

extension CoreDataManager {
    
    func fetchEntity<OutPut>(entity: Entity,
                             predicate: NSPredicate?,
                             mapper: ([NSManagedObject]) -> [OutPut]?) -> [OutPut]? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity.rawValue)
        do {
            let object = try privateContext.fetch(fetchRequest)
            return mapper(object)
        } catch {
            let coreDataError = error as NSError
            fatalError("Unresolved error \(coreDataError), \(coreDataError.userInfo)")
        }
    }
    
    func saveContext() {
        if privateContext.hasChanges {
            do {
                try privateContext.save()
            } catch {
                let coreDataError = error as NSError
                fatalError("Unresolved error \(coreDataError), \(coreDataError.userInfo)")
            }
        }
    }
}
