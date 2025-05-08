//
//  EventsPage.swift
//  ListAway
//
//  Created by Lily P. Makula on 4/24/25.
//
import SwiftUI

// Main view for the Events page
struct EventsPageView: View {
    // 🔘 Controls if the textfield shows up or not
    @State var showEventsTextfield = false
    // ✍️ Holds the user's current input
    @State var event = ""
    // 📦 Stores all the events the user adds
    @State var eventsArray: [String] = []// starts with an empty string
   
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 🖼️ Background image for the whole page
                Image("EventsPageBackground")
                    .resizable()
                    .frame(height: 890)
                    .offset(y: -20)
                
                // 🖼️ Title image at the top of the page
                Image("eventsTitle")
                    .resizable()
                    .frame(width: 450, height: 150)
                    .offset(y: -310)
                    .shadow(color: .gray,radius: 10)
                    .shadow(color: .white,radius: 10)
                
                Button {
                    showEventsTextfield = true
                } label: {
                    
                    Image("AddEvent") // 🖼️ The image used as a button
                        .resizable()
                        .frame(width: 150,height: 150)
                        .shadow(color: .yellow,radius: 10)
                    
                }
                .offset(x:00,y:-240)
                
                if showEventsTextfield {
                    TextField("Enter your event name", text: $event)
                        .foregroundColor(.red)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(12)
                        .shadow(color: .orange.opacity(0.9), radius: 5, x: 0, y: 5)
                        .font(.custom("Courier New", size: 30))
                        .bold()
                        .offset(x: 35, y: -130)
                        .onSubmit {
                            eventsArray.append(event)
                        }
                }
                
                if !eventsArray.isEmpty {
                    ForEach(eventsArray, id: \.self) { event in
                        NavigationLink(event, destination: {
                            EventsSmallView(event: event)
                        })
                        .font(.custom("MarkerFelt-Wide", size: 24))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(
                            Capsule()
                                .fill(Color(red: 1.0, green: 0.8, blue: 0.85))
                                .shadow(color: .pink.opacity(0.6), radius: 10, x: 0, y: 5)
                        )
                        .offset(x: -105, y: 290)
                        
                        
                        
                    }
                }
                
                
                Spacer() // 🧱 pushes content up
            }
            
        }
    }
}

// 🧪 Preview in SwiftUI Canvas
struct EventsPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EventsPageView()
        }
    }
}
