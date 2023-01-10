//
//  Expences.swift
//  iExpense
//
//  Created by Danya Kukhar on 10.01.2023.
//

import Foundation

class Expences: ObservableObject {
    @Published var items = [ExpenceItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
                
        }
    }
    
    var personalItems: [ExpenceItem] {
        items.filter { $0.type == "Personal" }
    }
    
    var businessItems: [ExpenceItem] {
        items.filter { $0.type == "Business" }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenceItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
