//
//  ItemBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/08.
//

import SwiftUI

// 하나하나 서브뷰를 만드는 것임 그리고 이것을 불러와 사용하는 것
struct ItemBasic: View {
    // property
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack{
            Text("\(count)")
            Text("\(title)")
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}

struct ItemBasic_Previews: PreviewProvider {
    static var previews: some View {
        // 디폴트로 일단 값을 초기화 시켜줘야함 프리뷰 보기 위해서
        ItemBasic(title: "사과", count: 1, color: .red)
            .previewLayout(.sizeThatFits)
        /*
         .previewLayout(.sizeThatFits)
  를 추기해주면 프리뷰가 화면 전체가 아니라 설정한 컴포넌트에 딱 맞춰서 사이즈가 나타나게 됨 이렇게 하면 훨씬더 편하게 아이템 베이직이 이런식으로 컴포넌트화 되었군아 알기 쉬움 
         */
    }
}
