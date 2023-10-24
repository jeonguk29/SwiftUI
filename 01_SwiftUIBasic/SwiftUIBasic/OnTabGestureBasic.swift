//
//  OnTabGestureBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/11/01.
//

import SwiftUI

/*
 탭 제스처 기능은 버튼을 클릭할 때 특정 이벤트가 실행되는 버튼
 속성과 비슷한데 버튼 값이 아닌 어떠한 이미지나 텍스트를 클릭할 때
 이벤트가 실행될 수 있게 설정하는 것이 온 탭 제스처 기능입니다.
 버튼과 다르게 사용자가 클릭하는 숫자를 변경할 수 있습니다.
 예를 들어 한 번 클릭했을 때 실행되지 않지만 두 번 또는 세 번
 탭핑했을 때 이벤트가
 */

struct OnTabGestureBasic: View {
	// property
	@State var isSelected: Bool = false
	
    var body: some View {
		VStack (spacing: 40) {
			// Rectangle 박스
			RoundedRectangle(cornerRadius: 25.0)
				.frame(height: 200)
				.foregroundColor(isSelected ? Color.green : Color.red)
			
			// 1. 일반적인 Button
			Button {
				isSelected.toggle()
			} label: {
				Text("1. 일반적인 Button")
					.font(.headline)
					.foregroundColor(.white)
					.frame(height: 55)
					.frame(maxWidth: .infinity)
					.background(Color.blue)
					.cornerRadius(25.0)
			}
			
			// 2. onTabGesture 한번 클릭시 실행
			Text("2. onTabGeture 한번 클릭")
				.font(.headline)
				.foregroundColor(.white)
				.frame(height: 55)
				.frame(maxWidth: .infinity)
				.background(Color.blue)
				.cornerRadius(25.0)
				.onTapGesture {
					isSelected.toggle()
				}
			
			// 3. onTabGesture 두번 클릭시 실행
			Text("3. onTabGeture 두번 클릭")
				.font(.headline)
				.foregroundColor(.white)
				.frame(height: 55)
				.frame(maxWidth: .infinity)
				.background(Color.blue)
				.cornerRadius(25.0)
				.onTapGesture(count: 2) {
					isSelected.toggle()
				}

			Spacer()
		}//: VSTACK
		.padding(40)
    }
}

struct OnTabGestureBasic_Previews: PreviewProvider {
    static var previews: some View {
        OnTabGestureBasic()
    }
}
