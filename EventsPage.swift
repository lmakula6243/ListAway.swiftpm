//
//  EventsPage.swift
//  ListAway
//
//  Created by Lily P. Makula on 4/24/25.
//

import SwiftUI

struct EventsPageView: View {
   
    var body: some View {
        NavigationView {
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
            VStack {
                Divider()
                HStack {
                    Text("Add a New Event                                             ")
                    NavigationLink {
                        NewEvent()
                        
                    } label: {
                        Image("plus1")
                            .resizable()
                            .frame(width: 60, height: 50)
                    }
                    
                    
                }
                Divider()
                ZStack {
                    Image(systemName: "square")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
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

