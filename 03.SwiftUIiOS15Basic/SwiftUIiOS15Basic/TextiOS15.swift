//
//  TextiOS15.swift
//  SwiftUIiOS15Basic
//
//  Created by 정정욱 on 11/27/23.
//

import SwiftUI

// 마크다운을 지원함
struct TextiOS15: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("1. Markdown")
                .font(.largeTitle)
                .foregroundStyle(.blue)
            
            // Italic
            Text("*Italic*")
            Text("_Italic_")
            
            Text("**Bold**")
            
            Text("***Bold & Italic***")
            Text("___Bold & Italic___")
            Text("[URL](http://www.naver.com)") // 실행은 되지 않음
            
            // 코드 형태로 나타내는 방법
            Text("`print(test)`")
        }
    }
}

struct TextSelctioniOS15: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("2. TextSelction")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
            
            Text("Text 선택 안됨 (기본 설정)")
            
            Text("Text 선택 됨 (복사, 공유 됨)") // 꾹누를때 
                .textSelection(.enabled)
            Spacer()
        }
        .font(.title)
    }
}


// 각각의 프리뷰 띄우는 방법
#Preview("Markdown"){
    TextiOS15()
    
}

#Preview("Text Selection"){
    TextSelctioniOS15()
}
