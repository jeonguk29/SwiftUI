//
//  StateBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/04.
//

import SwiftUI

struct StateBasic: View {
    
    // @State는 고정값이 아닌 상태가 변하는 뷰를 구성할때 반드시 넣어야 하는 값임 : 붙은 변수는 값이 변경될때마다 UI update가 됨
    
    // property
    @State var backgroundColor: Color = Color.green
    @State var myTitle: String = "아직 버튼 안눌림"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            //background
            backgroundColor
                .ignoresSafeArea()
            
            //content
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                Text("카운트 : \(count)")
                
                HStack(spacing: 20) {
                    Button {
                        // action
                        self.backgroundColor = .red
                        self.myTitle = "1번 버튼 눌림"
                        self.count += 1
                    } label: {
                        Text("1번 버튼")
                    }
                    
                    Button {
                        // action
                        
                        // 참고로 @State 사용시 self. 생략가능
                        backgroundColor = .purple
                        myTitle = "2번 버튼 눌림"
                        count -= 1
                    } label: {
                        Text("2번 버튼")
                    }
                }
            }
            .foregroundColor(.white) // 전체 VStack 색상을 지정
            
        }
    }
}

struct StateBasic_Previews: PreviewProvider {
    static var previews: some View {
        StateBasic()
    }
}
