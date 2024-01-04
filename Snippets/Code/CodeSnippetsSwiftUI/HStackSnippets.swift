//
//  HStackSnippets.swift
//  CodeSnippetsSwiftUI
//
//  Created by Jacob Ko on 1/12/23.
//

import SwiftUI

struct HStackSnippets: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20 ) {
                HStack(spacing: 20) {
                    Text("HStack 1")
                    Text("HStack 3")
                } //:HSTACK
                
                HStack(spacing: 20) {
                    Text("HStack 3")
                } //:HSTACK
                
            } //:VSTACK
            .navigationTitle("HStack Snippets")
        } //:NAVSTACK
    }
}

#Preview {
    HStackSnippets()
}
