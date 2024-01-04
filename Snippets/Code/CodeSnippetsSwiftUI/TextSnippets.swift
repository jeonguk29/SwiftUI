//
//  TextSnippets.swift
//  CodeSnippetsSwiftUI
//
//  Created by Jacob Ko on 1/12/23.
//

import SwiftUI

struct TextSnippets: View {
	
	@State private var text: String = ""
	
    var body: some View {
		NavigationStack {
			VStack(spacing: 20) {
				Text("Text Default")
				
				Text("Text LargeTitle")
					.font(.largeTitle)
				
				Text("Text Title")
					.font(.title)
				
				Text("Text Bold")
					.bold()
				
				Text("Text Font Custom")
					.font(.custom("Gill Sans", size: 36))
					.fontWeight(.bold)
				
				Text("Text maxWidth")
					.padding()
					.frame(maxWidth: .infinity)
					.background(Color.green)
					.padding(.horizontal)
				
				TextField("TextField", text: $text)
					.textFieldStyle(.roundedBorder)
					.padding(.horizontal)
				
				
			} //:VSTACK
			.navigationTitle("Text Snippets")
		} //:NAVSTACK
    }
}

#Preview {
    TextSnippets()
}
