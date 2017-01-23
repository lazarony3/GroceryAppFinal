//
//  Array+Extensions.swift
//  GroceryAppBook
//
//  Created by Lazarony, Robert on 1/21/17.
//  Copyright © 2017 Lazarony, Robert. All rights reserved.
//

import Foundation

extension Array {
    func value(at index: Int) -> Element? {
        guard index >= 0 && index < endIndex else { return nil }
        return self[index]
    }
}
