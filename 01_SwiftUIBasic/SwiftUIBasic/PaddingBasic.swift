//
//  PaddingBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/02.
//

import SwiftUI

struct PaddingBasic: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            // 1.Padding 기본
            Text("Hello, World!")
                .background(Color.yellow)
                .padding() // .ppading(.all, 15)
                .padding(.leading, 20) // CSS 기준 padding
                .background(Color.blue)
                .padding(.bottom) // CSS 기준 margin
            
            // background기준으로 위, 아래 padding이 어디 붙어있는지에 따라 조금 다름
            
            
            Divider()
            // 2.Padding 응용
            Text("Hellow, World!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            
            Text("안녕하세요 여러분 패딩패딩을 배워봅시다. 안녕하세요 여러분 패딩패딩을 배워봅시다. 안녕하세요 여러분 패딩패딩을 배워봅시다. 안녕하세요 여러분 패딩패딩을 배워봅시다. 안녕하세요 여러분 패딩패딩을 배워봅시다.안녕하세요 여러분 패딩패딩을 배워봅시다.")
        }
        // VStack 범위 밖에서 padding 설정
        .padding()
        .padding(.vertical, 30) // 위 아래 패딩 주기
        .background(
            Color.white
                .cornerRadius(10) // 음영주기
                .shadow(
                    color: Color.black.opacity(0.3), radius: 10,
                    x: 10, y : 10 )
            
        )// y축이 화면이 꽉차서 음영이 보이지 않음
        .padding() // 해주면 음영이 보이게 됨
    }
}

struct PaddingBasic_Previews: PreviewProvider {
    static var previews: some View {
        PaddingBasic()
    }
}
