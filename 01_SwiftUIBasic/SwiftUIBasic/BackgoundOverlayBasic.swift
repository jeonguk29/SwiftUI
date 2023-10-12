//
//  BackgoundOverlayBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/01.
//

import SwiftUI

struct BackgoundOverlayBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            // 1.Background
            Text("Hellow, World!")
                .frame(width: 100, height: 100)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
                        )
                )
                .frame(width: 120, height: 120)
                .background(
                    Circle()
                        .fill(Color.red)
                )
            
            Divider()
            
            // 2.Overlay
            Circle()
                .fill(Color.pink)
                .frame(width: 100, height: 100)
                .overlay( // pink Circle 보다 앞쪽에 나타나는 영역을 지정
                    Text("1")
                        .font(.title)
                        .foregroundColor(Color.white)
                )
                .background( // // pink Circle 뒷쪽에 나타나는 영역을 지정
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 120, height: 120)
                )
            
            Divider()
            // 3.Background and overlay
            
            Rectangle()
                .frame(width: 200, height: 200)
                .overlay(
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                    ,alignment: .leading
                )
                .background( // 뒷배경은 축이되는 frame(width: 200, height: 200)보다 커야함
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 250, height: 250)
                )
                .padding()// 기본적으로 앞에 Divider와 간격을 두게 됨
            
            Divider()
            
            Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundColor(Color.white)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.cyan, Color.blue]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                                // 10시 방향 부터 5시 방향으로 설정
                            )
                        )
                        .frame(width: 100, height: 100)
                        .shadow(color: Color.blue, radius: 10 , x: 0,y: 10)// 그림자 속성을 나타냄 radius는 퍼지는 정도
                        .overlay(
                            Circle()
                                .fill(Color.red)
                                .frame(width: 35, height: 35)
                                .overlay(
                                    Text("2")
                                        .font(.headline)
                                        .foregroundColor(Color.white)
                                )
                                .shadow(color: Color.red, radius: 10, x: 5, y: 5)
                            ,alignment: .bottomTrailing
                        )
                )
                .padding()
    
            
        }
    }
}

struct BackgoundOverlayBasic_Previews: PreviewProvider {
    static var previews: some View {
        BackgoundOverlayBasic()
    }
}
