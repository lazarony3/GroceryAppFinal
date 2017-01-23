//
//  GAConstants.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/21/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import Foundation

/// Grocery App Constants

struct GAConstants {
    /// Constants for our table views
    struct TableCell {
        /// Cell Identifier for the grocery list and grocery item table views
        static let rightDetail = "Cell"
    }
    struct Entities {
        static let groceryList = "GroceryList"
        static let groceryItem = "GroceryItem"
    }
    struct Segues {
        static let unwindToGroceryLists = "unwindToGroceryLists"
        static let unwindToGroceryItems = "unwindToGroceryItems"
    }
}
