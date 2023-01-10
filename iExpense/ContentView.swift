//
//  ContentView.swift
//  iExpense
//
//  Created by Danya Kukhar on 09.01.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expences = Expences()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expences.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete { indexSet in
                    removeItems(at: indexSet)
                }
            }
            .navigationTitle("iExpence")
            .toolbar {
                Button {
                    let expence = ExpenceItem(name: "Test", type: "Personal", amount: 5)
                    
                    expences.items.append(expence)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expences.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
