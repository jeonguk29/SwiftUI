//
//  YoutubeView.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/26.
//

import SwiftUI
import WebKit

// UIKit에 있는 것을 가져다 쓸때 UIViewRepresentable 채택
struct YoutubeView: UIViewRepresentable {
	let videoID: String
	
    // 초기화해서 만들어줘야함 makeUIView 라는 메서드로
	func makeUIView(context: Context) -> WKWebView {
		return WKWebView()
	}
	
	func updateUIView(_ uiView: WKWebView, context: Context) {
        // 유튜브 퍼가기에서 주소를 추출해 삽입
		guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
		uiView.scrollView.isScrollEnabled = false // 스크롤 불가능 하게
		uiView.load(URLRequest(url: youtubeURL))
	}
}

