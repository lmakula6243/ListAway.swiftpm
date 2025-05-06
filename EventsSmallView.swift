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
    @Binding var event: String
    var body: some View {
        VStack {
            Text(event)
            TextField("Add an Item to pack", text: $NewItemName)
            TextField("Enter the quanity", value: $NewItemQuantity, format: .number)
            Button {
                let newItem = PackingItem(name: NewItemName, quantity: NewItemQuantity!)
                items.append(newItem)
            } label: {
                Image(systemName: "plus")
            }
            

            
                List {
                    ForEach(items, id: \.self) { currentItem in
                        ListView(currentItem: currentItem)
                        
                        
                    
                }
            }
            
        }
    }
}


    

