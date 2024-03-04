//
//  ContentView.swift
//  FCM_Tutorial
//
//  Created by 정정욱 on 3/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var welcomeTitle: String = ""
    
    /*
     앱 스토어 테스트플라이 심사 올릴때는 무조건 릴리즈 모드로 반영 됨
     */
    var body: some View {
        VStack {
            Text(welcomeTitle)
                .font(.largeTitle)
                .padding()
                .onAppear(perform: {
                    #if DEBUG
                    welcomeTitle = "디버그 모드 입니다."
                    #else
                    welcomeTitle = "운영 모드 입니다."
                    #endif
                })
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
