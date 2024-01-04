//
//  FormSnippets.swift
//  CodeSnippetsSwiftUI
//
//  Created by Jacob Ko on 1/12/23.
//

import SwiftUI

struct FormSnippets: View {
    var body: some View {
		NavigationStack {
			VStack(spacing: 20) {
				Form {
					Section {
						// Content
						Text("Placeholder")
						
					} header: {
						Text("Header")
						
					} footer: {
						Text("Footer")
					} //:SECTION
					
                    // sse 만 치면 섹션 하나 더 나옴
					Section {
						// Content
						Text("Placeholder")
						
					} header: {
						Text("Header")
						
					} footer: {
						Text("Footer")
					} //:SECTION
					
				} //:FORM
			} //:VSTACK
			.navigationTitle("Form Snippets")
		} //:NAVSTACK
    }
}

#Preview {
    FormSnippets()
}
