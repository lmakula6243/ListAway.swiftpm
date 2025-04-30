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
                Image("EventsPageBackground")
                    .resizable()
                    .frame(height: 890)
                    .offset(y:-20)
                Image("eventsTitle")
                    .resizable()
                    .frame(width: 450, height: 150)
                    .offset(y:-310)
                    .shadow(radius: 10)
                Button {
                    showEventsTextfield = true
                    if showEventsTextfield == true {
                        TextField("Enter your event", text: $event)
                    }

                } label: {
                    Image("AddEvent")
                        .resizable()
                        .frame(width: 150,height: 150)
                        .offset(y:-240)
                        .shadow(radius: 10)
                
                }
               
            
          
                ZStack {
                    Image(systemName: "square")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
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
    

