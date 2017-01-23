//
//  AddGroceryListsViewController.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/22/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import Foundation
import UIKit

class AddGroceryListsViewController: UIViewController, ViewModelContainer {
    
    // MARK: - Properties
    
    var viewModel: GroceryListsViewModel = GroceryListsViewModel()
    
    @IBOutlet var groceryListName: UITextField?
    
    // MARK: - Actions
    
    @IBAction func dismiss() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
    
    @IBAction func addList() {
        do {
            try viewModel.createGroceryList(with: groceryListName?.text)
            
            performSegue(withIdentifier: GAConstants.Segues.unwindToGroceryLists, sender: nil)
        }
        catch {
            print(error)
        }
    }
}
