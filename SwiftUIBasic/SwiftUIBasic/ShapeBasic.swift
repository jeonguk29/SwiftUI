//
//  ShapeBasic.swift
//  SwitftUIBasic
//
//  Created by 정정욱 on 2023/07/31.
//

import SwiftUI

struct ShapeBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            // circle 원형
            Text("원형").font(.title)
            Circle()
            //.fill(Color.blue)
            //.foregroundColor(.red)
            //.stroke(Color.red, lineWidth: 20)
            //.stroke(Color.purple, style: StrokeStyle(lineWidth: 30, lineCap: .butt, dash: [30]))
                .trim(from: 0.2, to: 1.0) // 도형 깎기
                .stroke(Color.purple, lineWidth: 50)
                .frame(width: 200, height: 100) // 도형의 크기를 지정
                .padding()
            
            // Ellipse 타원형
            Text("타원형").font(.title)
            Ellipse()
                .fill(Color.green)
                .frame(width: 200, height: 100, alignment: .center)
            
            // 캡슐형
            Text("캡슐형").font(.title)
            Capsule(style: .circular)
                .stroke(Color.blue, lineWidth: 30)
                .frame(width: 200, height: 100, alignment: .center)
        }
        
        VStack(spacing: 20) {
        
            // 직사각형
            Text("직사각형").font(.title)
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 100, alignment: .center)
            
            // 둥근 직사각형
            Text("둥근직사각형")
                .font(.title)
            RoundedRectangle(cornerRadius: 20)
                .trim(from: 0.4, to: 1.0)
                .frame(width: 300, height: 200, alignment: .center)
        }
    }
}

struct ShapeBasic_Previews: PreviewProvider {
    static var previews: some View {
        ShapeBasic()
    }
}
