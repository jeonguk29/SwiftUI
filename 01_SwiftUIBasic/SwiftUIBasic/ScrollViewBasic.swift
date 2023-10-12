//
//  ScrollViewBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/03.
//

import SwiftUI

struct ScrollViewBasic: View {
    var body: some View {
        // 1번 - 세로 스크롤
        ScrollView(.vertical, showsIndicators: true){
            //showsIndicators: true 하면 스크롤 바가 생성됨
            ForEach(0..<50) { index in
                Rectangle()
                    .fill(Color.blue)
                    .frame(height: 300)
                    .overlay(
                        Text("\(index) 번")
                    )
            }
        }
        
        // 2번 - 가로 스크롤
        ScrollView(.horizontal, showsIndicators: true){
            HStack{
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 300 ,height: 300)
                        .overlay(
                            Text("\(index) 번")
                        )
                }
            }
        }
        
        // 3번 - 혼합
        // .vertical, showsIndicators: true 기본값이 생략되어 있는 것임
        ScrollView(){
            // LazyVStack 사용시 화면에 보여지는 부분만 로딩이 됨 ScrollView에서 많이 사용함 추후 다룰 예정
            LazyVStack {
                ForEach(0..<10) {_ in
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            ForEach(0..<20) { index in
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    }
                }
            }
        }
        
    }
}

struct ScrollViewBasic_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBasic()
    }
}
