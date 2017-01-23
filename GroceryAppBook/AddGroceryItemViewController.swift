//
//  AddGroceryItemViewController.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/22/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import Foundation
import UIKit

class AddGroceryItemViewController: UIViewController, ViewModelContainer, SelectedGroceryListContainer {
    
    // MARK:  -  Properties
    
    @IBOutlet var groceryItemName: UITextField?
    @IBOutlet var groceryItemQuantity: UITextField?
    
    var viewModel: GroceryItemsViewModel = GroceryItemsViewModel()
    
    var selectedGroceryList: GroceryList? {
        get {
            return viewModel.groceryList
        }
        set {
            viewModel.groceryList = newValue
        }
    }
    
    
    // MARK: - Actions
    
    @IBAction func dismiss() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
    
    @IBAction func addItem() {
        do {
            let quantity = Int( groceryItemQuantity?.text ?? "0")
            try viewModel.createGroceryItem(with: groceryItemName?.text, and: quantity)
            
            performSegue(withIdentifier: GAConstants.Segues.unwindToGroceryItems, sender: nil)
        }
        catch {
            print(error)
        }
    }
}
