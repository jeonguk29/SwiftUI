//
//  DarkModeBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/10/27.
//

import SwiftUI

struct DarkModeBasic: View {
	// property
	@Environment(\.colorScheme) var colorScheme // 해당 환경 변수를 통해 라이트, 다크모드 색상 변경 가능
	
    var body: some View {
		NavigationView {
			ScrollView {
				VStack (spacing: 20) {
					// primary and secondary color 는 자동으로 다크 모드일때 색 변환 됨
					Text("Primary 색상")
						.foregroundColor(.primary)
					Text("Secondary 색상")
						.foregroundColor(.secondary)
					
                    // 일반적인 black , white 는 고정값임
					Text("Black Color")
						.foregroundColor(.black)
					Text("White Color")
						.foregroundColor(.white)
					Text("Red Color")
						.foregroundColor(.red)
                    
					// Asset 에서 adaptive 라는 이름의 color Set 을 만든 후 light, dark mode 에서 색을 설정해줄 수 있음
					Text("Asset 에서 Adpative 색 설정")
						.foregroundColor(Color("AdaptiveColor"))
					
                    
                    // @Environment 사용해서 colorSchme 사용하기
					Text("@Environment 사용해서 Adpative 색 설정")
						.foregroundColor(colorScheme == .light ? .green : .blue)
				}
			}//: SCROLL
		} //:NAVIGATION
    }
}

struct DarkModeBasic_Previews: PreviewProvider {
    static var previews: some View {
        DarkModeBasic()
    }
}
