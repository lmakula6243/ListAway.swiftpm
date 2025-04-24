import SwiftUI

struct ContentView: View {
    @State var xPosition:CGFloat = -550
    @State var yPosition:CGFloat = 0
    
    var body: some View {
        NavigationView{
        ZStack {
            
            
            
            Image("BG")
            
            
            
                .resizable()
                .frame(width: 1500,height: 1000)
                .offset(x: xPosition, y: yPosition)
                .onAppear{
                    withAnimation(.easeIn.speed(0.1).repeatForever()){
                        xPosition += 1100
                        
                        if xPosition == 550{
                            withAnimation(.easeInOut.speed(-5).repeatForever()){
                                xPosition += -1100
                                if xPosition == -550 {
                                    withAnimation(.easeInOut.speed(-5).repeatForever()){
                                        xPosition += 1100
                                        
                                    }
                                    
                                    
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
           
                VStack{
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

