//
//  GradientBasic.swift
//  SwitftUIBasic
//
//  Created by 정정욱 on 2023/07/31.
//

import SwiftUI

struct GradientBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            
            // Linear Gradient 선형 그라디언트
            Text("Linear Gradient")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.red, Color.blue]), // 컬러 2가지로 그라디언트를 줄것임
                        startPoint: .topLeading,
                        endPoint: .bottom)
                    )
                    .frame(width: 300, height: 200)
            
            // Radial Gradient
            Text("Radial Gradient")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [Color.yellow, Color.purple]),
                        center: .leading, // 그라디언트 중심점
                        startRadius: 5,
                        endRadius: 300) // 시작점을 기준으로 원형으로 퍼져나감
                )
                .frame(width: 300, height: 200)
            
            // Angular Gradient
            /*
             RadialGradient는 원형만 가능한데 Angular Gradient는 특정 각도를 줘서 그라디언트 표현 가능
             */
            Text("Angular Gradient")
                .font(.title)
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    AngularGradient(
                        gradient: Gradient(colors: [Color.blue, Color.green]),
                        center: .topLeading,
                        angle: .degrees(180 + 45)
                    )
                )
                .frame(width: 300, height: 200)
                
        }
    }
}

struct GradientBasic_Previews: PreviewProvider {
    static var previews: some View {
        GradientBasic()
    }
}
