//
//  ViewModelContainer.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/21/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import Foundation

protocol ViewModelContainer {
    associatedtype VM: ViewModel
    
    var viewModel: VM { get set }
}
