//
//  GroceryItemsViewModel.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/21/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import Foundation

class GroceryItemsViewModel: ViewModel {
    
    // MARK: - Properties
    
    var groceryList: GroceryList?
    
    var groceryItems: [GroceryItem] {
        let result = groceryList?.items?.flatMap {
            $0 as? GroceryItem
        }
        
        return result ?? []
    }
    
    // MARK: - Grocery Item Data
    
    func groceryItem(at indexPath: IndexPath) -> (name: String?, quantity: Int16) {
        let item: GroceryItem? = groceryItems.value(at: indexPath.row)
        return (item?.name, item?.quantity ?? 0)
    }
    
    func createGroceryItem(with name: String?, and quantity: Int?) throws {
        guard name?.isEmpty == false,
            let itemQuantity = quantity,
            let newItem = GroceryItem(managedObjectContext: managedObjectContext) else {
                throw GroceryDataError.Saving("There was an error creating new gocery item \(name)")
        }
        newItem.name = name
        newItem.quantity = Int16(itemQuantity)
        groceryList?.addToItems(newItem)
        try save()
    }
}
