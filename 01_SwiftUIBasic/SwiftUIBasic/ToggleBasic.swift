//
//  ToggleBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/30.
//

import SwiftUI

struct ToggleBasic: View {
	// property
	@State var toggleIsOn: Bool = false
	
    var body: some View {
		VStack {
			HStack {
				Text("로그인 상태:")
				Text(toggleIsOn ? "온라인" : "오프라인")
			} //: HStack
			Toggle(
				isOn: $toggleIsOn) { // 언제 on을 시킬건가
					Text("로그인 상태 선택")
				} //: Toggle
				.toggleStyle(SwitchToggleStyle(tint: Color.red))
            //토글 스타일 지정 선택시 색상 변경
            
			Spacer()
		} //: VStack
		.padding(.horizontal, 100)
    }
}

struct ToggleBasic_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBasic()
    }
}
