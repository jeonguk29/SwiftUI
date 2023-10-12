//
//  ExtractSubViewBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/08.
//

import SwiftUI


struct ExtractSubViewBasic: View {
    var body: some View {
        ZStack {
            // background
            Color.cyan
                .ignoresSafeArea()
            
            //content
            contentLayer
        }
    }
    
    var contentLayer: some View {
        //(Extact View를 정말 많이 사용하는 경우2)
        // 똑같은 코드를 재사용하기위해
        HStack {
            ItemBasic(title: "사과", count: 1, color: .red)
            ItemBasic(title: "오렌지", count: 10, color: .orange)
            ItemBasic(title: "사과", count: 1, color: .yellow)
        }
    }
}

struct ExtractSubViewBasic_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubViewBasic()
    }
}
