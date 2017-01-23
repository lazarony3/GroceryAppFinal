//
//  GroceryItemsViewController.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/21/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import Foundation
import UIKit

class GroceryItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewModelContainer, SelectedGroceryListContainer {
    
    // MARK: - Properties
    var selectedGroceryList: GroceryList? {
        get {
            return viewModel.groceryList
        }
        set {
            viewModel.groceryList = newValue
        }
    }
    
    var viewModel: GroceryItemsViewModel = GroceryItemsViewModel()
    
    @IBOutlet var groceryItemsTableView: UITableView?
    
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.groceryItems.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item = viewModel.groceryItem(at: indexPath)
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "Quantity: \(item.quantity)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: GAConstants.TableCell.rightDetail, for: indexPath)
    }
    
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if var groceryListContainer = segue.destination as? SelectedGroceryListContainer {
            groceryListContainer.selectedGroceryList = selectedGroceryList
        }
    }
    
    @IBAction func unwindToGroceryItems(segue: UIStoryboardSegue) {
        groceryItemsTableView?.reloadData()
    }
    
}
