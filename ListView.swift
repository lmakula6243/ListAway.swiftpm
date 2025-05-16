//
//  ListView.swift
//  ListAway
//
//  Created by Lily P. Makula on 5/6/25.
//

import SwiftUI

struct ListView: View {
    let currentItem: PackingItem
    @State var completedItem = false
    @State var checkMark = ""
    var body: some View {
        VStack(alignment:
                .leading) {
            HStack {
                Text(currentItem.name)
                    .font(.custom("Chalkboard SE", size: 40))
                    .foregroundStyle(.pink)
                    
                Spacer()
                Button {
                    completedItem.toggle()
                } label: {
                    Image(systemName: completedItem ? "checkmark.circle" : "circle")
                                            .foregroundColor(completedItem ? .green : .gray)
                                            .font(.system(size: 50))
                                            
    
                }
                
                
             
                
                
            }
                    Divider()
            Text("Quantity: \(currentItem.quantity)")
                        .font(.custom("Chalkboard SE", size: 25))
                        .foregroundStyle(.gray)
                       
                    }
    }
}
