import SwiftUI

struct ContentView: View {
    @State var xPosition: CGFloat = -550
    @State var yPosition: CGFloat = 0
   @State var NewEventName = ""
    var body: some View {
        NavigationView {
            ZStack {
                Image("BG")
                    .resizable()
                    .frame(width: 1500, height: 1000)
                    .offset(x: xPosition, y: yPosition)
                    .onAppear {

                        withAnimation(Animation.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
                            // auto reverse: -550 ➡️ 550 ➡️ -550 ➡️ 550... (looping)
                            xPosition = 550
                        }
                    }
                    .onDisappear {
                        xPosition = 550
                       
                    }
                   
                    
                
                VStack {
                    Image("title3")
                        .resizable()
                        .frame(width: 400, height: 350)
                        .shadow(radius: 50)
                    
                    
                    NavigationLink {
                        EventsPageView()
                    } label: {
                        Image("startButton")
                            .resizable()
                            .frame(width: 200, height: 120)
                            .shadow(radius: 20)
                    }
                }
            }
            
        }
        
    }
}


