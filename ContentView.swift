import SwiftUI

struct ContentView: View {
    @State var xPosition: CGFloat = -550
    @State var yPosition: CGFloat = 0
    @State var NewEventName = ""
    @AppStorage("hasSeenOnBoarding") private var hasSeenOnBoarding: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                Image("BG")
                    .resizable()
                    .frame(width: 1500, height: 1000)
                    .offset(x: xPosition, y: yPosition)
                    .onAppear {
                        
                        withAnimation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                            // auto reverse: -550 -> 550 -> -550 -> 550... (looping)
                            xPosition = 550
                        }
                    }
                    .onDisappear {
                        xPosition = 550
                        
                    }
                
                
                
                VStack {
                    Image("title4")
                        .resizable()
                        .frame(width: 400, height: 350)
                        .shadow(color: .yellow, radius: 10)
                        .shadow(color: .pink, radius: 1)
                    
                    
                    
                    NavigationLink {
                        EventsPageView()
                    } label: {
                        Image("startButton")
                            .resizable()
                            .frame(width: 200, height: 120)
                            .shadow(color: .yellow, radius: 10)
                    }
                    NavigationLink("See Instructions", destination: {
                        OnBoarding()
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
                    }
                    
                }
                
            }
        }


