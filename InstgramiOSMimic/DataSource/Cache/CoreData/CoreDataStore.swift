//
//  CoreDataStore.swift
//  InstgramiOSMimic
//
//  Created by Ahmed Naser on 11/09/2021.
//

import Foundation
import CoreData

class CoreDataStore: Storage {
    typealias Input = NSManagedObject

    func save<Model>(mapper: (Model) -> Model?) where Model: NSManagedObject {
        let _ = mapper(Model(context: CoreDataManager.shared.privateContext))
        
        if CoreDataManager.shared.privateContext.hasChanges {
            do {
                try CoreDataManager.shared.privateContext.save()
            } catch {
                let coreDataError = error as NSError
                fatalError("Unresolved error \(coreDataError), \(coreDataError.userInfo)")
            }
        }
    }
    
    
    func fetch<Output>(type: String, mapper: ([NSManagedObject]) -> [Output]?) -> [Output]? {
        let fetchRequest = NSFetchRequest<Input>(entityName: type)
        do {
            let object = try CoreDataManager.shared.privateContext.fetch(fetchRequest)
            return mapper(object)
        } catch {
            let coreDataError = error as NSError
            fatalError("Unresolved error \(coreDataError), \(coreDataError.userInfo)")
        }
    }
}
