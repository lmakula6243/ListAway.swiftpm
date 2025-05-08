//
//  EventsPage.swift
//  ListAway
//
//  Created by Lily P. Makula on 4/24/25.
//
import SwiftUI

// Main view for the Events page
struct EventsPageView: View {
    // State variable to show or hide the TextField
    @State var showEventsTextfield = false
    
    // Holds the user's input for a new event
    @State var event = ""
    
    // Stores the list of events the user adds
    @State var eventsArray: [String] = []
    
    let columns = [
        GridItem(.adaptive(minimum: 150))]
   
    var body: some View {
        ZStack {
            // Background image
            Image("EventsPageBackground")
                .resizable()
                .frame(height: 890)
                .offset(y: -20)

            // Title image at the top
            Image("eventsTitle")
                .resizable()
                .frame(width: 450, height: 150)
                .offset(y: -310)
                .shadow(color: .gray, radius: 10)
                .shadow(color: .white, radius: 10)

            // Button to show the event input field
            Button {
                showEventsTextfield = true
            } label: {
                Image("AddEvent")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .shadow(color: .yellow, radius: 10)
            }
            .offset(x: 0, y: -240)

            // Show the TextField only when toggled
        
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
            LazyVGrid(columns: columns, spacing: 20) {
                // Display the added events as styled text
                if !eventsArray.isEmpty {
                    ForEach(eventsArray, id: \.self) { event in
                        Text(event)
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

            
                    }
                }
            }
            Spacer() // Pushes everything up inside ZStack
        }
    }
}

// SwiftUI preview
struct EventsPage_Previews: PreviewProvider {
    static var previews: some View {
        EventsPageView()
    }
}
