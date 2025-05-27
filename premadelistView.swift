import SwiftUI

struct PremadeListView: View {
    var body: some View {
        NavigationStack {
            ZStack {
            
                Image("TropicalBackground")
                    .resizable()
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("🌴 Pre-Made Vacation Lists")
                        .font(.custom("MarkerFelt-Wide", size: 48))
                        .foregroundColor(.white)
                        .padding()
                        .shadow(radius: 3)
                        

                    List {
                        Section(header: Text("Destinations").foregroundColor(.white)) {
                            NavigationLink(destination: DestinationDetailView(
                                destinationName: "Hawaii",
                                items: ["Swimsuit", "Sunscreen", "Flip-flops", "Beach towel", "Snorkeling gear"]
                            )) {
                                Text("🌺 Hawaii")
                            }

                            NavigationLink(destination: DestinationDetailView(
                                destinationName: "Miami",
                                items: ["Sunglasses", "outfits", "Beachwear", "Portable fan", "Water bottle"]
                            )) {
                                Text("🌞 Miami")
                            }

                            NavigationLink(destination: DestinationDetailView(
                                destinationName: "Camping in Yosemite",
                                items: ["Tent", "Flashlight", "Bug spray", "smores supplies", "Sleeping bag"]
                            )) {
                                Text("🌲 Yosemite")
                            }

                            NavigationLink(destination: DestinationDetailView(
                                destinationName: "NYC Trip",
                                items: ["Walking shoes", "Metro card", "Jacket", "Umbrella", "Phone charger"]
                            )) {
                                Text("🗽 New York")
                            }

                            NavigationLink(destination: DestinationDetailView(
                                destinationName: "Paris",
                                items: ["Outfits", "Euros", "Plug adapter", "Travel journal", "Perfume"]
                            )) {
                                Text("🇫🇷 Paris")
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.white.opacity(0.3))
                }
                .padding()
            }
        }
    }
}

struct premadelist: View {
    var body: some View {
        
    }
}
