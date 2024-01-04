//
//  NavStackVStackSnippets.swift
//  CodeSnippetsSwiftUI
//
//  Created by Jacob Ko on 1/12/23.
//

import SwiftUI

struct NavStackVStackSnippets: View {
    var body: some View {
		NavigationStack {
			VStack(spacing: 20) {
				
			} //:VSTACK
			
			VStack(spacing: 20) {
				Text("VStack Spacing")
				
			} //:VSTACK
			
			VStack(spacing: 20) {
				Text("VStack Spacer")
				
				Spacer()
				
			} //: VSTACK
			
			.navigationTitle("Navigation with Title")
		} //:NAVSTACK
    }
}

struct NavStackToolbar: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
            } //:VSTACK
            .toolbar {
                // Leading Icon
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // Action
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
                
                // Trailing Icon
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // Action
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
            } //:TOOLBAR
            .navigationTitle("Navigation")
        } //:NAVSTACK
    }
}

#Preview("NavStack with Vstack") {
    NavStackVStackSnippets()
}

#Preview("NavStack Toolbar") {
	NavStackToolbar()
}
