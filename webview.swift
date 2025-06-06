//
//  webview.swift
//  ListAway
//
//  Created by Khadija Azam on 5/12/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        let request = URLRequest(url: url)
        
        
        
        uiView.load(request)
    }
}
