//
//  GroceryListsViewController.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/21/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import UIKit

class GroceryListsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewModelContainer {
    // MARK: - Properties
    
    @IBOutlet var groceryListsTableView: UITableView?
    var viewModel: GroceryListsViewModel = GroceryListsViewModel()
    
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if var groceryListContainer = segue.destination as? SelectedGroceryListContainer {
            let indexPath = groceryListsTableView?.indexPathForSelectedRow
            
            viewModel.transferGroceryList(at: indexPath!, to: &groceryListContainer)
        }
    }
    
    @IBAction func unwindToGroceryLists(segue: UIStoryboardSegue) {
        groceryListsTableView?.reloadData()
    }
    

    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.groceryLists.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let list = viewModel.groceryList(at: indexPath)
        
        cell.textLabel?.text = list.name
        cell.detailTextLabel?.text = "\(list.itemCount) Items"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: GAConstants.TableCell.rightDetail, for: indexPath)
    }
}
