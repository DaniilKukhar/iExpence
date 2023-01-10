//
//  View-ExpenceStylling.swift
//  iExpense
//
//  Created by Danya Kukhar on 10.01.2023.
//

import SwiftUI

extension View {
    func style(for item: ExpenceItem) -> some View {
        if item.amount < 10 {
            return self.font(.body)
                .foregroundColor(.green)
        } else if item.amount < 100 {
            return self.font(.title3)
                .foregroundColor(.yellow)
        } else {
            return self.font(.title)
                .foregroundColor(.red)
        }
    }
}
