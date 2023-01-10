//
//  Expences.swift
//  iExpense
//
//  Created by Danya Kukhar on 10.01.2023.
//

import Foundation

class Expences: ObservableObject {
    @Published var items = [ExpenceItem]()
}
