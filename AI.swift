//
//  AI.swift
//  ListAway
//
//  Created by Khadija Azam on 5/12/25.
//
import SwiftUI

struct ChatBotView: View {
    var body: some View {
        NavigationStack {
            WebView(url: URL(string: "https://chat.openai.com")!)
                .edgesIgnoringSafeArea(.all)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
