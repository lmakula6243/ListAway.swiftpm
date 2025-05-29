//
//  OnBoarding.swift
//  ListAway
//
//  Created by Lily P. Makula on 5/16/25.
//
import SwiftUI

struct OnBoarding: View {
    var body: some View {
        NavigationStack {
            
            
            TabView {
                OB1View()
                OB2View()
                OB3View()
                OB4View()
                OB5View()
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}
#Preview {
    OnBoarding()
}

struct OB1View: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.pink.gradient)
            VStack {
                Text("  ListAway Instructions")
                    .font(.custom("Chalkboard SE", size: 40))
                    .padding()
                HStack {
                    Image(systemName: "camera.macro")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Image(systemName: "list.bullet.clipboard")
                        .resizable()
                        .frame(width: 40, height: 50)
                    Image(systemName: "camera.macro")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
            .foregroundStyle(.white)
        }
        .frame(width: 350, height: 350)
    }
}
#Preview {
    OB1View()
}

struct OB2View: View {
    @AppStorage("hasSeenOnBoarding") private var hasSeenOnBoarding: Bool = false
    var body: some View {
        
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.pink.gradient)
                VStack {
                    Text("- Click the large plus button to create a new list!")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    ZStack {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Image(systemName: "macwindow.and.cursorarrow")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    Text("- Name your list based on your trip destination")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    HStack {
                        Image(systemName: "")
                    }
                    Text("- Click enter to add the new destination")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    
                       
                }
                .foregroundStyle(.white)
            }
            .frame(width: 350, height: 350)
        }
    }

#Preview {
    OB2View()
}

struct OB3View: View {
    @AppStorage("hasSeenOnBoarding") private var hasSeenOnBoarding: Bool = false
    var body: some View {
        
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.pink.gradient)
                VStack {
                    Text("- Next begin to create your packing list for your specific destination")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    Text("- Type in your item and how many of it you need")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    Text("- Click Enter to add your item")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                }
                .foregroundStyle(.white)
            }
            .frame(width: 350, height: 350)
        }
    }

#Preview {
    OB3View()
}

struct OB4View: View {
    @AppStorage("hasSeenOnBoarding") private var hasSeenOnBoarding: Bool = false
    var body: some View {
        
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.pink.gradient)
                VStack {
                    Text("Click the circle in the corner of each item to check it off")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                }
                .foregroundStyle(.white)
            }
            .frame(width: 350, height: 350)
        }
    }

#Preview {
    OB4View()
}

struct OB5View: View {
    @AppStorage("hasSeenOnBoarding") private var hasSeenOnBoarding: Bool = false
    var body: some View {
        
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.pink.gradient)
                VStack {
                    Text("Now you will never forget another thing to pack on your vacation!")
                        .font(.custom("Chalkboard SE", size: 30))
                        .padding()
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 20, height: 20)
                    NavigationLink("Continue to App", destination: {
                        ContentView()
                    })
                    .font(.custom("MarkerFelt-Wide", size: 20))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .background(
                        Capsule()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.pink,
                                        Color.yellow,
                                        Color.blue
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .shadow(color: .pink.opacity(0.6), radius: 10, x: 0, y: 5)
                    )
                }
                .foregroundStyle(.white)
            }
            .frame(width: 350, height: 350)
        }
    }

#Preview {
    OB5View()
}


