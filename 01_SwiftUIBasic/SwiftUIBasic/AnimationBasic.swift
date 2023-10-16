//
//  AnimationBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/18.
//

import SwiftUI

struct AnimationBasic: View {
	// property
	@State var isAnimated: Bool = false // 애니메이션이 될때 안될때
	
	let timing: Double = 5.0
	
	var body: some View {
		
		// 1번 View
		VStack {
			Button {
				withAnimation( // 애니메이션 불러오기
					.default    // 기본 효과
                        //.repeatCount(5) // 5번 반복
                        //.repeatForever() // 무한 반복
						//.delay(1.0) // 1초 뒤에 동작하도록
				) {
					isAnimated.toggle() // 애니메이션 될때 실행되는 로직
				}
			} label: {
				Text("Button")
			}
			
			Spacer()
			
			RoundedRectangle(cornerRadius: isAnimated ? 50 : 0)
				.fill(isAnimated ? Color.red : Color.green)
				.frame(
					width: isAnimated ? 100 : 300,
					height: isAnimated ? 100 : 300
				)
				.rotationEffect(Angle(degrees: isAnimated ? 360 : 0)) // 도형을 돌리기 참이면 360도 돌림
				.offset(y: isAnimated ? 300 : 0) // x,y 축으로 이동시키기 ex 300픽셀
			
			Spacer()
		}
		
		// 2번 View - Speed에 따른 animation
		VStack {
			Button {
				isAnimated.toggle()
			} label: {
				Text("Button")
			}
			
			
			// liner animation : 처음부터 끝까지 속도가 일정합니다
			RoundedRectangle(cornerRadius: 20)
				.frame(width: isAnimated ? 350 : 50, height: 100)
				.animation(.linear(duration: timing), value: isAnimated) // 도형의 애니메이션 줄때 .animation 사용
			
			// easeIn animation : 처음에 느렸다가 끝에 빨라지는 효과입니다
			RoundedRectangle(cornerRadius: 20)
				.frame(width: isAnimated ? 350 : 50, height: 100)
				.animation(.easeIn(duration: timing), value: isAnimated)
			
			// easeOut animation : 처음엔 빨랐다가 끝에 느려지는 효과입니다
			RoundedRectangle(cornerRadius: 20)
				.frame(width: isAnimated ? 350 : 50, height: 100)
				.animation(.easeOut(duration: timing), value: isAnimated)
			
			// easeInOut animation : 처음과 끝에 느려지고, 중간부분이 빨라지는 효과입니다
			RoundedRectangle(cornerRadius: 20)
				.frame(width: isAnimated ? 350 : 50, height: 100)
				.animation(.easeInOut(duration: timing), value: isAnimated)
		}
		
		
		// 3번 View - Spring animation
		VStack {
			Button {
				// respose: 단일 진동을 완료하는 데 걸리는 시간
				// damping: 얼마나 빠르게 스프링이 정지하는 속도제어 만약 0일때 영원 멈추지 않음  0 ~ 1.0 (1.0일때는 스프링 효과가 없음)
				// blendDuration : 다른 에니메이션 간의 전환 길이 제어
				withAnimation(.spring(
					response: 0.5,
					dampingFraction: 0.5,
					blendDuration: 0)) {
						isAnimated.toggle()
					}
			} label: {
				Text("Button")
			}
			RoundedRectangle(cornerRadius: 20)
				.frame(width: isAnimated ? 350 : 50, height: 100)

		}
	}
}

struct AnimationBasic_Previews: PreviewProvider {
	static var previews: some View {
		AnimationBasic()
	}
}
