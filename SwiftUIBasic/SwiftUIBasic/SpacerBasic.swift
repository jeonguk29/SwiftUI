//
//  SpacerBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/03.
//

import SwiftUI

struct SpacerBasic: View {
    var body: some View {
        // 1번 - Spacer 예시 도형
        HStack(spacing: 0) {
            Spacer(minLength: 10) // 최소길이
                .frame(height: 10)
                .background(Color.orange)
            Rectangle()
                .frame(width: 50, height: 50)
            Spacer()
                .frame(height: 10)
                .background(Color.orange)
            Rectangle()
                .fill(Color.red)
                .frame(width: 50, height: 50)
            Spacer()
                .frame(height: 10)
                .background(Color.orange)
            Rectangle()
                .fill(Color.green)
                .frame(width: 50, height: 50)
            Spacer()
                .frame(height: 10)
                .background(Color.orange)
            
            // 이렇게 사이사이 간격을 줄수 있음
        }
        .background(Color.yellow)
        
        // 2번 - App 상단 설정 닫기 아이콘 만들기
        VStack{
            HStack(spacing: 0){
                Image(systemName: "xmark")
                
                Spacer() // 최대한 공간을 차지하려는 속성이 있어서 좌우로 밀어내는 형식이 됨

                Image(systemName: "gear")
            }
            .font(.title)
            .padding(.horizontal) // 수평 패딩 값 줌
            
            Spacer() // HStack을 빠져나와 사용하면 VStack기준 즉 남은 수직의 최대 공간을 차지하려고 할것임
        }
    }
}

struct SpacerBasic_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBasic()
    }
}
