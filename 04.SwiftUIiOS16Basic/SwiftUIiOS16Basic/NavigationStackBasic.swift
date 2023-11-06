//
//  NavigationStackBasic.swift
//  SwiftUIiOS16Basic
//
//  Created by Jacob Ko on 2022/12/09.
//

import SwiftUI

/*
 이번 네비게이션 스택에서는 단어에서 보시다시피 스택 개념이 추가되어 기존 UIKit에서 사용되는 네비게이션 방식과 동일하게 데이터와 루트를 가지고 있어 화면 전환시 보다 직관적으로 이동 가능
 */
struct NavigationStackBasic: View {
	
	@State var stack = NavigationPath() // 초기 설정
	
    var body: some View {
		NavigationStack(path: $stack) {
			NavigationLink("2번재 페이지 이동", value: 40)
				.navigationDestination(for: Int.self) { value in // 도착 할 부분 설정 넘길값이 40이면 Int.self "40" 이면 Sting.self
					VStack (spacing: 20) {
						
						NavigationLink("3번째 페이지 이동", value: 100) // 3번째 페이지 이동
						
						Text("나의 나이는 \(value) 입니다")
						Button {
//							stack.removeLast() // ⭐️ 이전페이지로 이동
							stack = .init() // ⭐️ 초기화면으로 바로 이동
						} label: {
//							Text("이전페이지로 이동하기")
							Text("초기화면으로 이동하기")
						}

					} //: VSTACK
				}
		} //: NAVIGATIONSTACK
    }
}

struct NavigationStackBasic_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackBasic()
    }
}
