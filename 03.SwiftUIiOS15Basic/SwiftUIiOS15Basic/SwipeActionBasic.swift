//
//  SwipeActionBasic.swift
//  SwiftUIiOS15Basic
//
//  Created by Jacob Ko on 2022/11/25.
//

import SwiftUI

struct SwipeActionBasic: View {
	
	// property
	@State var fruits: [String] = [
		"사과", "오렌지", "바나나", "복숭아"
	]
	
    var body: some View {
		List {
			ForEach(fruits, id: \.self) { // item in 생략후 아래 처럼 사용가능
				Text($0)
                // 스와이프 뒤쪽 설정
					.swipeActions(edge: .trailing, allowsFullSwipe: false) { // true 주면 끝까지 밀어서 실행 가능함 버튼 누르지 않고
						Button {
							// action
						} label: {
							Text("SAVE")
						}
						.tint(.green)
						
						Button {
							// action
						} label: {
							Text("DELETE")
						}
						.tint(.red)
					}
					.swipeActions(edge: .leading, allowsFullSwipe: true) {
						Button {
							// action
						} label: {
							Text("SHARE")
						}
						.tint(.yellow)

					}
			}
		} //: LIST
    }
}

struct SwipeActionBasic_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionBasic()
    }
}
