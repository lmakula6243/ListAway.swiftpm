import SwiftUI

struct Event: Codable, Hashable {
    var name: String
    var day: Int
    var month: Int
    var year: Int
}

struct EventsPageView: View {
    @State var showEventsTextfield = false
    @State var event = ""
    @State var eventDay: Int?
    @State var eventMonth: Int?
    @State var eventYear: Int?

    let eventsKey = "savedEvents"
    


    @State var eventsArray: [Event] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(eventsArray) {
                UserDefaults.standard.set(encoded, forKey: eventsKey)
            }
        }
    }

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Image("EventsPageBackground")
                    .resizable()
                    .frame(height: 890)
                    .offset(y: -50)

                VStack(spacing: 20) {
                    Image("eventsTitle")
                        .resizable()
                        .frame(width: 450, height: 150)
                        .shadow(color: .gray, radius: 10)
                        .shadow(color: .white, radius: 10)

                    Button {
                        showEventsTextfield = true
                    } label: {
                        Image("AddEvent")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .shadow(color: .yellow, radius: 10)
                    }
                    .offset(y: -90)

                    if showEventsTextfield {
                        VStack(spacing: 10) {
                            TextField("Enter your event name", text: $event)
                                .foregroundColor(.red)
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(12)
                                .shadow(color: .orange.opacity(0.9), radius: 5, x: 0, y: 5)
                                .font(.custom("Courier New", size: 30))
                                .bold()
                                .padding(.horizontal)

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
                            .padding(.horizontal)

                            Button("Add Event") {
                                if let day = eventDay,
                                   let month = eventMonth,
                                   let year = eventYear,
                                   !event.trimmingCharacters(in: .whitespaces).isEmpty {
                                    let newEvent = Event(name: event, day: day, month: month, year: year)
                                    eventsArray.append(newEvent)
                                    event = ""
                                    eventDay = nil
                                    eventMonth = nil
                                    eventYear = nil
                                    showEventsTextfield = false
                                }
                            }
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }
                        .padding(.bottom)
                    }

                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(eventsArray, id: \.self) { eventItem in
                                IndividualEventView(currentEvent: eventItem)
                            }
                        }

                        Button(action: {
                            eventsArray.removeAll()
                        }) {
                            Image(systemName: "trash.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                                .padding()
                                .background(Capsule().fill(Color.pink))
                                .shadow(color: .pink.opacity(0.6), radius: 10, x: 0, y: 5)
                        }
                        .padding(.top)

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
                        .padding(.top)
                    }

                    Spacer()
                }
                .padding()
                .onAppear {
                    if let data = UserDefaults.standard.data(forKey: eventsKey),
                       let decoded = try? JSONDecoder().decode([Event].self, from: data) {
                        eventsArray = decoded
                    }
                }
            }
        }
    }
    
}

