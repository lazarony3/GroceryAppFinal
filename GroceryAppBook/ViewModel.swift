//
//  ViewModel.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/21/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ViewModel {
    // MARK: - Properties
    
    var persistentContainer: PersistentContainer?
    var managedObjectContext: NSManagedObjectContext? {
        return persistentContainer?.managedObjectContext
    }
    
    // MARK: - Initializer
    
    init(persistentContainer: PersistentContainer? = UIApplication.shared.delegate as? AppDelegate) {
        self.persistentContainer = persistentContainer
    }
    
    
    // MARK: - Core Data
    
    func save() throws {
        try managedObjectContext?.save()
    }

    func executeRequest<Type: NSManagedObject> () throws -> [Type]? {
        let request = Type.fetchRequest()
        return try request.execute() as? [Type]
    }
    
    func fetch<Type: NSManagedObject> () -> [Type]? {
        var result: [Type]? = nil
        
        managedObjectContext?.performAndWait { [weak self] in
            do {
                result = try self?.executeRequest()
            }
            catch {
                print(error)
            }
        }
        return result
    }
}
