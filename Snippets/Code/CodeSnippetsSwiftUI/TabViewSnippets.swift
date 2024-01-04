//
//  TabViewSnippets.swift
//  CodeSnippetsSwiftUI
//
//  Created by Jacob Ko on 1/12/23.
//

import SwiftUI

struct TabViewSnippets: View {
    var body: some View {
		NavigationStack {
			VStack(spacing: 20) {
				TabView {
					Text("Screen One")
						.tabItem {
							Image(systemName: "star.fill")
							Text("Screen One")
						}
					
					Text("Screen Two")
						.tabItem {
							Image(systemName: "heart")
							Text("Screen Two")
						}
				} //:TABVIEW
			} //:VSTACK
			.navigationTitle("TabView")
		} //:NAVSTACK
    }
}

#Preview {
    TabViewSnippets()
}
