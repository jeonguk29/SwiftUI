//
//  ContentView.swift
//  Filter
//
//  Created by 정정욱 on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home()
                // darkMode...
                .navigationTitle("Filter")
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
