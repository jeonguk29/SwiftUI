//
//  BadgeBasic.swift
//  SwiftUIiOS15Basic
//
//  Created by Jacob Ko on 2022/11/25.
//

import SwiftUI

struct BadgeBasic: View {
    var body: some View {
		
        // TabView
		TabView {
			// 1번
			Color.red.ignoresSafeArea(edges:.top)
				.tabItem {
					Image(systemName: "heart.fill")
					Text("LOVE")
				}
				.badge(0) // 0이면 표시되지 않음
			
			// 2번
			Color.green.ignoresSafeArea(edges:.top)
				.tabItem {
					Image(systemName: "heart.fill")
					Text("LOVE")
				}
				.badge(5)
			
			// 3번
			Color.blue.ignoresSafeArea(edges:.top)
				.tabItem {
					Image(systemName: "heart.fill")
					Text("LOVE")
				}
				.badge("NEW")
			
		} // :TABVIEW
		
		// LIST
		
		List {
			Text("Hello")
				.badge("New Items!")
			Text("Hello")
				.badge(10)
			Text("Hello")
			Text("Hello")
			Text("Hello")
		} //: LIST
        
    }
}

struct BadgeBasic_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBasic()
    }
}
