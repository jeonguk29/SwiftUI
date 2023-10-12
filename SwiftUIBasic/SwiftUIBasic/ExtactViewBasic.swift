//
//  ExtactViewBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/08.
//

import SwiftUI

struct ExtactViewBasic: View {
    // property
    @State var backgroundColor: Color = Color.pink
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
//            VStack{
//                Text("Extact View 연습")
//                    .font(.largeTitle)
//
//                Button {
//                    backgroundColor = .yellow
//                } label: {
//                    Text("바탕색 변경")
//                        .font(.headline)
//                        .foregroundColor(Color.white)
//                        .padding()
//                        .background(Color.black)
//                        .cornerRadius(10)
//                }
//            }
            contentLayer
        }
    }
    // body 부분이 너무 길어지면 가독성을 위해 Extact 즉 추출을 할 수 있음 (Extact View를 많이 사용하는 경우1)
    // VStack 자체를 추출해서 변수로 만들 수 있음
    
    //Content
    var contentLayer: some View {
        VStack{
            Text("Extact View 연습")
                .font(.largeTitle)
            
            Button {
                //backgroundColor = .yellow
                buttonPressed()
            } label: {
                Text("바탕색 변경")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
    }
    
    // Function : 즉 이벤트(컬러 변경 등), 데이터 처리 같은 것도 따로 빼서 만들수 있음 => 재사용성 증가
    func buttonPressed() {
        backgroundColor = .yellow
    }
}

struct ExtactViewBasic_Previews: PreviewProvider {
    static var previews: some View {
        ExtactViewBasic()
    }
}
