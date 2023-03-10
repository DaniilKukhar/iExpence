//
//  AddView.swift
//  iExpense
//
//  Created by Danya Kukhar on 10.01.2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expences: Expences
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .localCurrency)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expence")
            .toolbar {
                Button("Save") {
                    let item = ExpenceItem(name: name, type: type, amount: amount)
                    expences.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expences: Expences())
    }
}
