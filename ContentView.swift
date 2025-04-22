import SwiftUI

struct ContentView: View {
    @State var xPosition:CGFloat = -330
    @State var yPosition:CGFloat = 0
    
    var body: some View {
        VStack {
            
            
            Image(systemName: "photo.artframe")
            
                .resizable()
                .frame(width: 1000,height: 1000)
                .offset(x: xPosition, y: yPosition)
                .onAppear{
                    
                    withAnimation(.easeIn.speed(0.1)){
                        xPosition += 500
                        
                        if xPosition == 170{
                            withAnimation(.easeOut.speed(0.1).delay(5)){
                                xPosition += -500
                                
                    }
                }
           
                }
            }
            
        }
    }
}
