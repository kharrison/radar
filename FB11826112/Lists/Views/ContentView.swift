//
//  ContentView.swift
//  Lists
//
//  Created by Keith Harrison on 24/11/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var itemStore: ItemStore
    @State private var visibility: NavigationSplitViewVisibility = .automatic
    @State private var selectedItemID: Item.ID?
    @State private var isInfo: Bool = false
    
    private var itemCount: Int { itemStore.itemCount }
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            ScrollViewReader { proxy in
                List(selection: $selectedItemID) {
                    ForEach(itemStore.items) { item in
                        NavigationLink(item.name, value: item.id)
                    }
                    .onDelete(perform: deleteItems)
                }
                .onChange(of: itemCount ) { [itemCount] newCount in
                    if newCount > itemCount,
                       let lastID = itemStore.lastItemID() {
                        selectedItemID = lastID
                        withAnimation {
                            proxy.scrollTo(lastID)
                        }
                    }
                }
            }
            .navigationTitle("Items")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        itemStore.newItem()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .keyboardShortcut("n")
                }
            }
        } detail: {
            NavigationStack {
                if let selectedItemID,
                   let item = itemStore.item(with: selectedItemID) {
                    ItemView(item: item)
                } else {
                    Text("Pick an item")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isInfo = true
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
            }
            .sheet(isPresented: $isInfo) {
                Text("Info")
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        itemStore.deleteItems(offsets)
        selectedItemID = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ItemStore.shared)
    }
}
