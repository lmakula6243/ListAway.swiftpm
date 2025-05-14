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
        ZStack {
            // 🌴 Tropical gradient background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.yellow.opacity(0.4),
                    Color.pink.opacity(0.3),
                    Color.blue.opacity(0.3)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 15) {
                Text(event)
                    .font(.title)
                    .bold()
                    .foregroundColor(.pink)

                // ✏️ Styled text field
                TextField("Add an Item to pack", text: $NewItemName)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(12)
                    .padding(.horizontal)

                TextField("Enter the quantity", value: $NewItemQuantity, format: .number)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(12)
                    .padding(.horizontal)

                // ➕ Add item button
                Button {
                    let newItem = PackingItem(name: NewItemName, quantity: NewItemQuantity ?? 1)
                    items.append(newItem)
                    saveItems()
                } label: {
                    Image(systemName: "plus")
                        .padding()
                        .background(
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.yellow, Color.pink, Color.blue]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                        )
                        .foregroundColor(.white)
                        .shadow(color: .pink.opacity(0.5), radius: 6, x: 0, y: 4)
                }

                // 📋 List of items
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
                .listStyle(.insetGrouped)
            }
            .padding(.top, 40)
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
