//
//  TextBasic.swift
//  SwitftUIBasic
//
//  Created by 정정욱 on 2023/07/29.
//

import SwiftUI

struct TextBasic: View {
    var body: some View {
        // 여기 안에서 UI 작업을 하면 됨
        VStack(spacing: 20) {
            // Font 사이즈를 title, body, footnote 등 정하면 reponsive : 기기 별로 알아서 텍스트를 맞춰줌
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
                .fontWeight(.semibold)// 폰트 굵기
                .bold() // .fontWeight(.bold)랑 같은 코드임
                .underline(true,color: .red)
                .italic()
                .strikethrough(true, color: Color.green)
                
        
            // 이 방법으로 하게 되면 text 크기를 지정할 수 있습니다. font 12, 40 단점 고정식 (아이패드 등 고정적인 값을 가짐 reponsive 하지 않음 )
            
            Text("Hello, World2".uppercased())
                .font(.system(size: 25, weight: .semibold, design: .serif))
            
            // multiline text alignment
            Text("멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다.")
                .multilineTextAlignment(.leading)
                .foregroundColor(.red)
            
        }
    }
}

struct TextBasic_Previews: PreviewProvider {
    static var previews: some View {
        TextBasic()
    }
}

// 커멘드, 옵션, p : 프리뷰 다시 리로드
// 커멘드, 0 : 폴더 접기
// 커맨드, 옵션 [ or ] : 해당 라인 코드를 위 아래로 이동시킴
