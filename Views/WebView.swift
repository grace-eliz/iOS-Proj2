//
//  WebView.swift
//  iOS-Proj2
//
//  Created by Amy Cunningham on 11/14/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let video: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(video)") else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
