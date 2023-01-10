//
//  ExpenceItem.swift
//  iExpense
//
//  Created by Danya Kukhar on 10.01.2023.
//

import Foundation

struct ExpenceItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double 
}
