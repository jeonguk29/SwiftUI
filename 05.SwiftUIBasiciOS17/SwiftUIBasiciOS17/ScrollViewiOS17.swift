//
//  ScrollViewiOS17.swift
//  SwiftUIBasiciOS17
//
//  Created by Jacob Ko on 16/11/23.
//

import SwiftUI

struct ScrollViewiOS17: View {
    var body: some View {
        /*
         💁 기존에는 TabView를 사용해서 페이징을 사용했는데 ScrollView를 통하여 사용하게 되었음
         */
		ScrollView(.horizontal) {
			LazyHStack (spacing: 30) {
				ForEach(1...3, id: \.self) { index in
					Image("mobile\(String(index))")
						.padding(.horizontal)
					// horizontal 방향으로 사진 가운데로 정렬
						.containerRelativeFrame(.horizontal) // 이미지가 화면 가운데에 딱 오도록 정렬가능
                        
				}
			}
			// 오직 main View 에서만 ScrollView 가 되고 안에 있는 subview 는 ScrollView 가 안되게끔 설정
			.scrollTargetLayout() // 현제 LazyHStack를 타겟으로 설정
		}
		// 위에 Target 으로 설정 된 Layout 에서 ScrollView 가 paging View 가 되게끔 설정하기
		.scrollTargetBehavior(.viewAligned) // spacing이 있어도 가운데 정렬이 가능함
    }
}

struct ScrollTransitioniOS17: View {
	var body: some View {
		ScrollView(.vertical) {
			LazyVStack (spacing: 20) {
				ForEach(1...30, id: \.self) { _ in
					RoundedRectangle(cornerRadius: 20)
						.fill(.blue.gradient)
						.frame(height: 200)
					// Scroll Transition
						.scrollTransition(
                            // . interactive 말고도 다양한 설정 값이 있음
							topLeading: .interactive,
							bottomTrailing: .animated) { view, phase in
                                view
                                    .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
                                // 점점 생성될때 밝아짐
                                // phase는 위치 즉 위치의 값이 0보다 작으면 -가 되서 없어짐, 아니면 보이도록 해당 값을 1을 빼주면 값이 없어지니까 재대로된 투명도가 없는 화면을 볼 수 있음
							}
				}
			}
			.padding(.horizontal)
		}
	}
}


#Preview("Paging") {
    ScrollViewiOS17()
}

#Preview("Scroll Transition") {
	ScrollTransitioniOS17()
}
