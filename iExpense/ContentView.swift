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
                ForEach(expences.items) { item in
                    Text(item.name)
                }
                .onDelete { indexSet in
                    removeItems(at: indexSet)
                }
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
    
    func removeItems(at offsets: IndexSet) {
        expences.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
