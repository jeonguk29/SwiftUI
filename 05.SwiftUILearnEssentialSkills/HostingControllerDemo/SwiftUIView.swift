//
//  SwiftUIView.swift
//  HostingControllerDemo
//
//  Created by 정정욱 on 11/20/23.
//

import SwiftUI

struct SwiftUIView: View {
    
    // Foundation 프레임워크의 UserDefaults 와 동일 (UIkit이 Foundation 을 포함)
    @AppStorage("userID") var userid = ""

    
    var text: String
    var body: some View {
        VStack {
            Text("\(userid), \(text)")
            Image(systemName: "smiley")
            Text("This is a SwiftUI View")
        }
    }
}

#Preview {
    SwiftUIView(text: "")
}
