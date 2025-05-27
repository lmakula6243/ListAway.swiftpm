//
//  IndividualEventView.swift
//  ListAway
//
//  Created by Lily P. Makula on 5/22/25.
//

import SwiftUI

struct IndividualEventView: View {
    @State var currentEvent: Event

    var body: some View {
        NavigationLink(destination: EventsSmallView(event: currentEvent.name)) {
            VStack {
                Text(currentEvent.name)
                    .font(.custom("MarkerFelt-Wide", size: 30))
                Text("\(currentEvent.day)/\(currentEvent.month)/\(currentEvent.year)")
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

