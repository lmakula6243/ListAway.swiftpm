//
//  EventsPage.swift
//  ListAway
//
//  Created by Lily P. Makula on 4/24/25.
//

import SwiftUI

struct EventsPageView: View {
    @State var showEventsTextfield = false
    @State var event = ""
    @State var eventsArray = [""]
    var body: some View {
        ZStack {
            // Background images
            Image("EventsPageBackground")
                .resizable()
                .frame(height: 890)
                .offset(y: -20)
            
            Image("eventsTitle")
                .resizable()
                .frame(width: 450, height: 150)
                .offset(y: -310)
                .shadow(radius: 10)
            
            VStack{
                
                
                Button {
                    showEventsTextfield = true
                } label: {
                    Image("AddEvent")
                        .resizable()
                        .frame(width: 150,height: 150)
                        .shadow(radius: 10)
                }
                .padding(.bottom)
                .offset(x:00,y:150)
                if showEventsTextfield {
                    TextField("     Enter your event", text: $event)      .foregroundColor(.red)                .background(Color.white.opacity(0.3))
                        .cornerRadius(12)
                        .shadow(color: .orange.opacity(0.9), radius: 5, x: 0, y: 5)
                        .font(.custom("Courier New", size: 30))
                        .bold()
                        .offset(x:00,y:150)
                        .onSubmit {
                            eventsArray.append(event)
                        }
                    ForEach(eventsArray, id: \.self) { event in
                        NavigationLink {
                            EventsSmallView( event: $event)
                        } label: {
                            Image("plus1")
                                .resizable()
                                .frame(width: 160,height: 140)
                                .offset(x: -100, y:200)
                            Text("\(event)")
                                .offset(x: -100, y:200)
                        }
                        
                        Spacer()
                    }
                    
                }
            }
            
            
        }
        }
        
        struct EventsPage_Previews: PreviewProvider {
            static var previews: some View {
                Group {
                    EventsPageView()
                }
            }
        }
}
