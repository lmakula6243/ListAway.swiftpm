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
         
            VStack(spacing: 20) {
               
                
                Button {
                    showEventsTextfield = true
                } label: {
                    Image("AddEvent")
                        .resizable()
                        .frame(width: 150,height: 150)
                        .shadow(radius: 10)
                }
                .padding(.bottom)
                
                if showEventsTextfield {
                    TextField("Enter your event", text: $event)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .background(Color.white)
                }
                
                Spacer()
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
