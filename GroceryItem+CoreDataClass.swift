//
//  GroceryItem+CoreDataClass.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/22/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import Foundation
import CoreData


public class GroceryItem: NSManagedObject {
    
    convenience init?(managedObjectContext: NSManagedObjectContext?) {
        guard   let mObjCtx = managedObjectContext,
            let entity =  NSEntityDescription.entity(forEntityName: GAConstants.Entities.groceryItem, in: mObjCtx)
            else {
                return nil
        }
        self.init(entity: entity, insertInto: mObjCtx)
    }
}
