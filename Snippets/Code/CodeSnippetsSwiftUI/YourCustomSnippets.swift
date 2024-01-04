//
//  YourCustomSnippets.swift
//  CodeSnippetsSwiftUI
//
//  Created by Jacob Ko on 1/12/23.
//

import SwiftUI

struct YourCustomSnippets: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Button("Sample Button") {
                    // Action
                    
                }
                .buttonStyle(.borderedProminent)
                .frame(width: 200, height: 200)
                .padding()
                
                HStack(spacing: 20) {
                    Text("Placeholder")
                }  //:HSTACK
                
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 150, height:150)
                
            } //: VSTACK
            .navigationTitle("placeholder")
        } //:NAVSTACK
    }
}

#Preview {
    YourCustomSnippets()
}
