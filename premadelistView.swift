import SwiftUI
// person at appswocse recommnded tshis
struct PremadeListView: View {
    
    @State private var titleOpacity = 0.0
    
    @State private var listOffset: CGFloat = 50

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
                        .opacity(titleOpacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1)) {
                                titleOpacity = 1
                            }
                        }
                    
                    //  Lsit trye
                    List {
                        Section(header: Text("Destinations").foregroundColor(.white)) {
                            NavigationLink(destination: DestinationDetailView(
                                destinationName: "Hawai",
                                items: ["Swimsuit", "Sunscreen", "Flip-flops", "Beach towel", "Snorkeling gear"]
                            )) {
                                Text("🌺 Hawai")
                            }
                            
                            NavigationLink(destination: DestinationDetailView(
                                destinationName: "Miami",
                                items: ["Sunglasses", "outfits", "Beachwear", "Portable fan", "Water bottle"]
                            )) {
                                
                                Text("🌞 Maimi")
                            }
                            
                            NavigationLink(destination: DestinationDetailView(
                                destinationName: "Ysoemtie",
                                items: ["Tent", "Flashlight", "Bug spray", "smores supplies", "Sleeping bag"]
                            )) {
                                Text("🌲 Yosemite")
                                
                                
                            }
                            
                            NavigationLink(destination: DestinationDetailView(
                                destinationName: "NYC ",
                                items: ["Walking shoes", "Metro card", "Jacket", "Umbrella", "Phone charger"]
                            )) {
                                Text("🗽 New Yok")
                            }
                            
                            
                            NavigationLink(destination: DestinationDetailView(
                                destinationName: "Paris",
                                items: ["Outfits", "Euros", "Plug adapter", "Travel journal", "Perfume"]
                            )) {
                                Text("🇫🇷 Paris")
                                
                                
                            }
                        }
                        
                        
                    }
                   
                    .offset(y: listOffset)
                    .onAppear {
                        withAnimation(.easeOut(duration: 1)) {
                            listOffset = 0
                        }
                    }
                    
                    
                    
                    
                    
                }
                .padding()
                
                
            }
        }
        
    }
}

