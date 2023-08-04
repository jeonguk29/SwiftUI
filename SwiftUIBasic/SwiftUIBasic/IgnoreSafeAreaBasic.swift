//
//  IgnoreSafeAreaBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/04.
//

import SwiftUI

struct IgnoreSafeAreaBasic: View {
    var body: some View {
        // 1번 화면
        ZStack {
            //background
            Color.blue
                .ignoresSafeArea() // edges: .top 이렇게 위 아래 선택할 수 있음
            // content
            VStack {
                Text("Hello, World!")
                    .font(.largeTitle)
            }
        }
        
        // 2번 화면
        ScrollView{
            VStack {
                Text("박스형 리스트")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
                
                ForEach(1..<11) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding()
                        .overlay {
                            Text("\(index) 번 리스트")
                        }
                    
                }
            }
        }
        .background(
            Color.blue
                .ignoresSafeArea()
        )
    }
    
}

struct IgnoreSafeAreaBasic_Previews: PreviewProvider {
    static var previews: some View {
        IgnoreSafeAreaBasic()
    }
}
