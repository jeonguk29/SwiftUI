//
//  iconBasic.swift
//  SwitftUIBasic
//
//  Created by 정정욱 on 2023/07/31.
//

import SwiftUI

struct iconBasic: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.fill.badge.plus")
                .resizable()// 크기를 최대한 화면사이즈에 크게 맞추는 것임 아이콘 크기 변경시 꼭 해줘야함
            // rendermode 에서 original로 하게되면 실제 color에서 Multi color 변경되게 됩니다.
            // 즉 고유 값 컬러로 변경되어서 color를 변경하더라도 변경되지 않는 컬러 값이 됩니다.
                .renderingMode(.original)
                .scaledToFill()// 부모인자에 맞춰서 최대한 커지기 (추구 다룰 내용)
                .foregroundColor(Color.red)
                .frame(width: 300, height: 300)
        }
    }
}

struct iconBasic_Previews: PreviewProvider {
    static var previews: some View {
        iconBasic()
    }
}
