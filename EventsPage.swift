import SwiftUI

struct EventsPageView: View {
    @State var showEventsTextfield = false
    @State var event = ""
    @State var eventsArray: [String] = []

    
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
                    
                    NavigationLink(destination: ChatBotView()) {
                        Text("Open AI Bot")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    if showEventsTextfield {
                        TextField("Enter your event name", text: $event)
                            .padding()
                            .foregroundColor(.red)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(12)
                            .shadow(color: .orange.opacity(0.9), radius: 5, x: 0, y: 5)
                            .font(.custom("Courier New", size: 24))
                            .bold()
                            .padding(.horizontal)
                            .onSubmit {
                                if !event.trimmingCharacters(in: .whitespaces).isEmpty {
                                    eventsArray.append(event)
                                }
                                event = ""
                                showEventsTextfield = false
                            }
                    }

                    // Scrollable grid with 2 columns
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(eventsArray, id: \.self) { event in
                                NavigationLink(event, destination: {
                                    EventsSmallView(event: event)
                                })
                                .font(.custom("MarkerFelt-Wide", size: 20))
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
                        .padding()
                    }
                }
                
                
                Spacer() // 🧱 pushes content up
            }
            
        }
    }
}

struct EventsPage_Previews: PreviewProvider {
    static var previews: some View {
        EventsPageView()
    }
}

