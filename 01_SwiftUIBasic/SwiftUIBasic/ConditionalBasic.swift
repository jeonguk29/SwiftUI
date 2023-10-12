//
//  ConditionalBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/17.
//

import SwiftUI

struct ConditionalBasic: View {
	// property
	@State var showCircle: Bool = false
	@State var showRectangle: Bool = false
	@State var isLoading: Bool = false

    var body: some View {
		VStack (spacing: 20) {
			// 로딩 버튼
			Button {
				isLoading.toggle() // 참/거짓 전환
			} label: {
				Text("로드중...: \(isLoading.description)")
			}
			
			// 로딩 이미지
			if isLoading { // if isLoading = ture {}
				ProgressView() // 진행중인걸 알려주는 뷰
			}
			
			// 원형 버튼
			Button {
				showCircle.toggle()
			} label: {
				Text("원형 버튼: \(showCircle.description)")
			}
			
			// 사각형 버튼
			Button {
				showRectangle.toggle()
			} label: {
				Text("사각형 버튼: \(showRectangle.description)")
			}
			
			// 조건 1: 원형 버튼이 true 일때
			if showCircle {
				Circle()
					.frame(width: 100, height: 100)
			}
			
			// 조건 2: 사각형 버튼 true 일때
			if showRectangle {
				Rectangle()
					.frame(width: 100, height: 100)
			}
			
			// 조건 3: 원형 버튼이 false 그리고 사각형 버튼이 false 에때
			if !showCircle && !showRectangle { // && = and
				RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.blue)
					.frame(width: 200, height: 100)
			}
			
			// 조건 4: 원형 버튼 true 또는 사각형 버튼 true 일때
			if showCircle || showRectangle { // || = or
				RoundedRectangle(cornerRadius: 25.0)
					.fill(Color.red)
					.frame(width: 200, height: 100)
			}
			
			Spacer() // 버튼들을 다 위로 올림

		}
    }
}

struct ConditionalBasic_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalBasic()
    }
}
