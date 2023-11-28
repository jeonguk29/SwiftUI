//
//  SymbolVariantiOS15.swift
//  SwiftUIiOS15Basic
//
//  Created by 정정욱 on 11/28/23.
//


import SwiftUI

// Symbol Variant를 사용해서 같은 심볼이라도 다양한 형태의 variation 즉 변화를 주어서 여러가지 형태의 아이콘을 생성할 수 있게 되었습니다.
// SF Symbol에서 직접 선택할 수 있지만 이렇게 변화를 주는게 가능해짐

struct SymbolVariantiOS15: View {
    var body: some View {
        VStack (spacing: 20) {
            Text("Symbol Variant")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
            
            List {
//                Label("None", systemImage: "heart")
                Label("None", systemImage: "heart").symbolVariant(.none)
                Label("Fill", systemImage: "heart").symbolVariant(.fill)
                Label("Circle", systemImage: "heart").symbolVariant(.circle)
                Label("Circle Fill", systemImage: "heart").symbolVariant(.circle.fill)
                Label("Rectangle", systemImage: "heart").symbolVariant(.rectangle)
                Label("Rectangle Fill", systemImage: "heart").symbolVariant(.rectangle.fill)
                Label("Squre", systemImage: "heart").symbolVariant(.square)
                Label("Squre Fill", systemImage: "heart").symbolVariant(.square.fill)
                Label("Slash", systemImage: "heart").symbolVariant(.slash)
                Label("Slash Fill", systemImage: "heart").symbolVariant(.slash.fill)
            }
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    SymbolVariantiOS15()
}
