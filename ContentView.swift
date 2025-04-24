import SwiftUI

struct ContentView: View {
    @State var xPosition: CGFloat = -550
    @State var yPosition: CGFloat = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("BG")
                    .resizable()
                    .frame(width: 1500, height: 1000)
                    .offset(x: xPosition, y: yPosition)
                    .onAppear {
                        print(xPosition)

                        withAnimation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                            // auto reverse: -550 ➡️ 550 ➡️ -550 ➡️ 550... (looping)
                            xPosition = 550
                        }
                    }
                    .onDisappear {
                        xPosition = 550
                        print(xPosition)
                    }
                    
                
                VStack {
                    Image("title3")
                        .resizable()
                        .frame(width: 400, height: 350)
                    
                    NavigationLink {
                        EventsPageView()
                    } label: {
                        Image("startButton")
                            .resizable()
                            .frame(width: 200, height: 120)
                    }
                }
            }
            
        }
        
    }
}


