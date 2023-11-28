//
//  LabeledContentiOS16.swift
//  SwiftUIiOS16Basic
//
//  Created by 정정욱 on 11/28/23.

import SwiftUI

/*
 라벨에서도 컨텐츠 영역을 만들어서 마치 JSON에서 키와 밸류 값으로 나타내듯이 텍스트 형태로 나타낼수 있음
 */
struct LabeledContentiOS16: View {
    
    @State var isAlert: Bool = false
    @State var isMute: Bool = false
    
    
    var body: some View {
        VStack (spacing: 10) {
            Text("LabeledContent")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
            
            LabeledContent("제목", value: "값")
            
            LabeledContent("제목") {
                // value 있는 위치에 라벨 삽입
                Label("사진기", systemImage: "camera")
            }
            
            // value가 Int방식이면 어떻게 나타낼지 정해줄 수 있음
            LabeledContent("퍼센트", value: 50, format: .percent)
            
            LabeledContent("금액", value: 400000, format: .currency(code: "krw"))
            
            LabeledContent {
                Text("값 Custom")
                    .font(.title.bold())
                    .foregroundStyle(.red)
            } label: {
                Text("제목")
                    .fontWeight(.bold)
            }
            
            List {
                LabeledContent("퍼센트", value: 50, format: .percent)
                
                LabeledContent("금액", value: 400, format: .currency(code: "usd"))
                
                // 리스트 안에서도 이런식으로 벨류 값으로 뷰를 묶어 표시 가능 
                LabeledContent("설정") {
                    GroupBox {
                        Toggle("알림끄기", isOn: $isAlert)
                        Toggle("음소거", isOn: $isMute)
                    }
                    .padding(.horizontal)
                }
            }
            
            Spacer()
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    LabeledContentiOS16()
}
