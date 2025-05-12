//
//  EventsSmallView.swift
//  ListAway
//
//  Created by Lily P. Makula on 4/30/25.
//
import SwiftUI
struct EventsSmallView: View {
    @State var items: [PackingItem] = []
    @State var NewItemName = ""
    @State var NewItemQuantity: Int?
    @State var showList: Bool = false
    @State var event: String
    var body: some View {
        VStack {
            Text(event)
            TextField("Add an Item to pack", text: $NewItemName)
            TextField("Enter the quanity", value: $NewItemQuantity, format: .number)
            Button {
                let newItem = PackingItem(name: NewItemName, quantity: NewItemQuantity ?? 1)
                items.append(newItem)
                saveItems()
            } label: {
                Image(systemName: "plus")
            }
            

            
                List {
                    ForEach(items, id: \.self) { currentItem in
                        ListView(currentItem: currentItem)
                        
                        
                    
                }
                    .onDelete { MyIndex in
                        items.remove(atOffsets: MyIndex)
                       
                        
                    }
            }
                
                .onAppear(){
                   items = loadItems(event: event)
                }
            
            
        }
    }
}


extension EventsSmallView {
    func saveItems() {
        UserDefaults.standard.set(try? JSONEncoder().encode(items), forKey: event)
    }
    
    
    func loadItems(event: String) -> [PackingItem] {
        guard let data = UserDefaults.standard.data(forKey: event) else {
            return []
        }
        return try! JSONDecoder().decode([PackingItem].self, from: data)
    }
}
