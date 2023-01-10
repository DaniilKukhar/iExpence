//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Danya Kukhar on 10.01.2023.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expences: [ExpenceItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section(title) {
            ForEach(expences) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    
                    Text(item.amount, format: .localCurrency)
                        .style(for: item)
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}

struct ExpenseSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseSection(title: "Example", expences: []) { _ in }
    }
}
