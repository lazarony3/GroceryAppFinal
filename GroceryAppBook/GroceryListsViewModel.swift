//
//  GroceryListsViewModel.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/21/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import Foundation

enum GroceryDataError: Error {
    case Saving(String)
}

class GroceryListsViewModel: ViewModel {
    // MARK: - Properties
    
    var groceryLists: [GroceryList] {
        return fetch() ?? []
    }
    
    // MARK: - Grocery List Data
    
    func groceryList(at indexPath: IndexPath) -> (name: String?, itemCount: Int) {
        let list: GroceryList? = groceryLists.value(at: indexPath.row)
        return (list?.name, list?.items?.count ?? 0)
    }
    
    // MARK: - Transfer Data
    
    func transferGroceryList(at indexPath: IndexPath, to container: inout SelectedGroceryListContainer) {
        container.selectedGroceryList = groceryLists.value(at: indexPath.row)
    }
    
    func createGroceryList(with name: String?) throws {
        guard name?.isEmpty == false,
            let newList = GroceryList(managedObjectContext: managedObjectContext) else {
            throw GroceryDataError.Saving("There was an error creating new gocery list \(name)")
        }
        newList.name = name
        try save()
    }
}
