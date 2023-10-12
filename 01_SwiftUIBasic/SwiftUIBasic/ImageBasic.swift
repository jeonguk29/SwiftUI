//
//  ImageBasic.swift
//  SwiftUIBasic
//
//  Created by 정정욱 on 2023/08/01.
//

import SwiftUI

struct ImageBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("Woogie")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .cornerRadius(150)
            
            Divider() // 구분선을 그려주는 함수
           
            Image("Woogie")
                .resizable() // selfarea에
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipShape(Circle()) // 짤라서 모양을 만들겠다
        }
    }
}

struct ImageBasic_Previews: PreviewProvider {
    static var previews: some View {
        ImageBasic()
    }
}
