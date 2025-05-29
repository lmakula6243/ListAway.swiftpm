//
//  destinationDetailView.swift
//  ListAway
//
//  Created by Khadija Azam on 5/27/25.
//

import SwiftUI

struct DestinationDetailView: View {
    var destinationName: String
    var items: [String]

    var body: some View {
        ZStack {
        
            Image("tropicalBackground")
                .resizable()
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 10) {
                Text(destinationName)
                    .font(.custom("MarkerFelt-Wide", size: 35))
                    .foregroundColor(.white)
                    .padding()

                List(items, id: \.self) { item in
                    Text("• \(item)")
                        .font(.custom("ChalkboardSE-Bold", size: 20))
                        .foregroundColor(.black)
                        .padding(.vertical, 5)
                }
                .background(Color.white.opacity(0.6))
                .scrollContentBackground(.hidden)
            }
        }
        .navigationTitle(destinationName)
    }
}


