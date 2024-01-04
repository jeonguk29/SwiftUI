//
//  ZStackSnippets.swift
//  CodeSnippetsSwiftUI
//
//  Created by Jacob Ko on 1/12/23.
//

import SwiftUI

struct ZStackSnippets: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Color
                Color.blue
                    .ignoresSafeArea()
                // Content
                
            } //:ZSTACK
            .navigationTitle("ZStack Background")
        } //:NAVSTACK
    }
}

struct ZStackSnippetsGradient: View {
    var body: some View {
        NavigationStack {
            ZStack {
//                LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                    .ignoresSafeArea()
//                
                // Content
                
                ZStack {
                    RadialGradient(gradient: Gradient(colors: [.white, .purple]), center: .bottom, startRadius: 10, endRadius: 620)
                        .ignoresSafeArea()
                    
                    // Content
                    
                } //:ZSTACK
                
            } //:ZSTACK
            .navigationTitle("ZStack Gradient")
        } //:NAVSTACK
    }
}


#Preview("Background Color") {
    ZStackSnippets()
}

#Preview("Gradient") {
    ZStackSnippetsGradient()
}
