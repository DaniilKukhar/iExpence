//
//  ContentView.swift
//  iExpense
//
//  Created by Danya Kukhar on 09.01.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expences = Expences()
    @State private var showingAddExpence = false
    
    var body: some View {
        NavigationView {
            List {
                ExpenseSection(title: "Business", expences: expences.businessItems, deleteItems: removeBusinessItems)
                
                ExpenseSection(title: "Personal", expences: expences.personalItems, deleteItems: removePersonalItems)
            }
            .navigationTitle("iExpence")
            .toolbar {
                Button {
                    showingAddExpence = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpence) {
                AddView(expences: expences)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenceItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expences.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
            
        }
        
        expences.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expences.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expences.businessItems)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
