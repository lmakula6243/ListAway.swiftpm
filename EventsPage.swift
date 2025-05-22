import SwiftUI

struct EventsPageView: View {
    @State var showEventsTextfield = false
    @State var event = ""
    
    
    // Stores the list of events the user adds
    @State var eventsArray: [String] = [] {
        didSet {
            UserDefaults.standard.set(eventsArray, forKey: eventsKey)
        }
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let eventsKey = "savedEvents"
    @State var eventDay: Int?
    @State var eventMonth: Int?
    @State var eventYear: Int?
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image
                Image("EventsPageBackground")
                    .resizable()
                    .frame(height: 890)
                    .offset(y: -50)
                
                VStack(spacing: 20) {
                    // Title image at the top
                    Image("eventsTitle")
                        .resizable()
                        .frame(width: 450, height: 150)
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
                    .offset(y: -90)
                    
                    // TextField for event name input, shown when triggered
                    VStack {
                        if showEventsTextfield {
                            TextField("Enter your event name", text: $event)
                                .foregroundColor(.red)
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(12)
                                .shadow(color: .orange.opacity(0.9), radius: 5, x: 0, y: 5)
                                .font(.custom("Courier New", size: 30))
                                .bold()
                                .offset(x: 35, y: -100)
                                .onSubmit {
                                    if !event.trimmingCharacters(in: .whitespaces).isEmpty {
                                        eventsArray.append(event)
                                        event = ""
                                        showEventsTextfield = false
                                    }
                                }
                            
                            HStack {
                                TextField("Day", value: $eventDay, format: .number)
                                
                                TextField("Month", value: $eventMonth, format: .number)
                                TextField("Year", value: $eventYear, format: .number)
                            }
                            
                            .foregroundColor(.red)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(12)
                            .shadow(color: .orange.opacity(0.9), radius: 5, x: 0, y: 5)
                            .font(.custom("Courier New", size: 20))
                            .bold()
                            .offset(x: 35, y: -10)
                            
                        }
                           
                            
                            // Scrollable grid with 2 columns for events
                            ScrollView {
                                LazyVGrid(columns: columns, spacing: 20) {
                                    ForEach(eventsArray, id: \.self) { event in
                                        NavigationLink(destination: EventsSmallView(event: event)) {
                                            VStack {
                                                Text(event)
                                                    .font(.custom("MarkerFelt-Wide", size: 30))
                                                Text("\(eventDay ?? 0)/\(eventMonth ?? 0)/\(eventYear ?? 0)")
                                                    .font(.custom("MarkerFelt-Wide", size: 15))
                                            }
                                            .foregroundColor(.white)
                                            .bold()
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 10)
                                            .background(
                                                Capsule()
                                                    .fill(Color(red: 1.0, green: 0.8, blue: 0.85))
                                                    .shadow(color: .pink.opacity(0.6), radius: 10, x: 0, y: 5)
                                            )
                                        }
                                    }
                                }
                                
                            }
                            Button(action: {
                                eventsArray.removeAll() // Clear the events array
                            }) {
                                HStack {
                                    Image(systemName: "trash.fill") // Trash icon
                                        .foregroundColor(.white)
                                        .font(.system(size: 25))
                                }
                                .padding()
                                .background(Capsule().fill(Color.pink))
                                .shadow(color: .pink.opacity(0.6), radius: 10, x: 0, y: 5)
                            }
                            .offset(x: 150, y: 50)
                            
                            NavigationStack {
                                VStack {
                                    NavigationLink(destination: ChatBotView()) {
                                        Text("Open AI Bot 💬")
                                            .font(.custom("MarkerFelt-Wide", size: 20))
                                            .foregroundColor(.white)
                                            .bold()
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 12)
                                            .background(
                                                Capsule()
                                                    .fill(
                                                        LinearGradient(
                                                            gradient: Gradient(colors: [
                                                                Color.pink,
                                                                Color.yellow,
                                                                Color.blue
                                                            ]),
                                                            startPoint: .topLeading,
                                                            endPoint: .bottomTrailing
                                                        )
                                                    )
                                                    .shadow(color: .pink.opacity(0.6), radius: 10, x: 0, y: 5)
                                            )
                                    }
                                }
                                .offset(y: -40)
                                .padding()
                            }
                            
                            Spacer() //  pushes stufg up
                        }
                    }
                }
                .onAppear {
                    
                    if let savedEvents = UserDefaults.standard.stringArray(forKey: eventsKey) {
                        eventsArray = savedEvents
                    }
                }
            }
        }
        
        struct EventsPage_Previews: PreviewProvider {
            static var previews: some View {
                EventsPageView()
            }
        }
        
        
        
    }
    

