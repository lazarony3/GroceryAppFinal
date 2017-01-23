//
//  PersistentContainer.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/22/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import Foundation
import CoreData

protocol PersistentContainer {
    var persistentContainer: NSPersistentContainer { get set }
    var managedObjectContext: NSManagedObjectContext { get }
}

extension PersistentContainer {
    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
