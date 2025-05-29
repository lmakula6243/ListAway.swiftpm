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
            ZStack {
                
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
}
    #Preview {
        OnBoarding()
    }
    
    struct OB1View: View {
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.pink.opacity(0.3))
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
            .frame(width: 350, height: 400)
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
                    .fill(.pink.opacity(0.3))
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
                        Image(systemName: "mountain.2")
                            .resizable()
                            .frame(width: 35, height: 30)
                        Image(systemName: "building.2")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Image(systemName: "beach.umbrella")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    Text("- Click enter to add the new destination")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    
                    
                }
                .foregroundStyle(.white)
            }
            .frame(width: 350, height: 400)
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
                    .fill(.pink.opacity(0.3))
                VStack {
                    Text("- Next begin to create your packing list for your specific destination")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    Image(systemName: "suitcase.rolling")
                        .resizable()
                        .frame(width: 30, height: 40)
                    Text("- Type in your item and how many of it you need")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    HStack {
                        Image(systemName: "pencil.and.list.clipboard")
                            .resizable()
                            .frame(width: 40, height: 40)
                        Image(systemName: "number.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    Text("- Click Enter to add your item")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    
                    
                }
                .foregroundStyle(.white)
            }
            .frame(width: 350, height: 400)
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
                    .fill(.pink.opacity(0.3))
                VStack {
                    Text("Click the circle in the corner of each item to check it off")
                        .font(.custom("Chalkboard SE", size: 20))
                        .padding()
                    Image(systemName: "checklist.rtl")
                        .resizable()
                        .frame(width: 60, height: 50)
                    
                }
                .foregroundStyle(.white)
            }
            .frame(width: 350, height: 400)
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
                    .fill(.pink.opacity(0.3))
                VStack {
                    Text("Now you will never forget another thing to pack on your vacation!")
                        .font(.custom("Chalkboard SE", size: 30))
                        .padding()
                    HStack {
                        Image(systemName: "suitcase")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                        Image(systemName: "list.clipboard")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                        Image(systemName: "face.smiling")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                        
                    }
                    .padding()
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
                                        Color.yellow.opacity(0.4),
                                        Color.pink.opacity(0.3),
                                        Color.blue.opacity(0.3)
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
            .frame(width: 350, height: 400)
        }
    }
    
    #Preview {
        OB5View()
    }
    
    

