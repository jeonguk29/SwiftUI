//
//  ButtonSnippets.swift
//  CodeSnippetsSwiftUI
//
//  Created by Jacob Ko on 1/12/23.
//

import SwiftUI

struct ButtonSnippets: View {
    var body: some View {
		NavigationStack {
			VStack(spacing: 20) {
				
				Button("Button with Title") {
					// Action
					
				}
				
				Button("Button with Style") {
					// Action
					
				}
				.buttonStyle(.borderedProminent)
				
				Button {
					// Action
					
				} label: {
					Text("Button and Action and Label ")
				}
				
				Button(action: {
					
				}, label: {
					Text("Button full Width")
						.frame(maxWidth: .infinity)
				})
				.buttonStyle(.borderedProminent)
				.padding(.horizontal)
				
			} //:VSTACK
			.navigationTitle("Button Snippets")
		} //:NAVSTACK
    }
}

#Preview {
    ButtonSnippets()
}
