//
//  ForEachLoopBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/03.
//

import SwiftUI

struct ForEachLoopBasic: View {
    // 변수 생성
    
    var data: [String] = ["Hi", "Hello", "Hey everyone"]
    
    var body: some View {
        // 1번
        VStack {
            ForEach(0..<10){ index in
                HStack {
                    Circle()
                        .frame(width: 20, height: 20)
                    Text("인덱스 번호 : \(index)번")
                }
                
            }
            
            Divider()
            
            // 2번
            // ForEach는 배열같은 컬랙션 타입 사용시 id값이 있어야함 RandomAccessCollection 타입이라
            // 그래서 data 요소의 각 id값을 하나하나 넣어줘야함
            // id: \.self 해주면 각각 data 요소의 id값을 부여한다는 것임 0,1,2,3
            ForEach(data, id: \.self) { item in
                Text(item)

            }
        }
    }
}

struct ForEachLoopBasic_Previews: PreviewProvider {
    static var previews: some View {
        ForEachLoopBasic()
    }
}
