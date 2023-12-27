//
//  SplashView.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/23.
//

import SwiftUI

struct SplashView: View {
	
	// property
    // 좋은 코드 : 해당 파일에서만 쓸거라 private 키워드를 붙여줌
	@State private var isActive: Bool = false
	@State private var size: Double = 0.5
	@State private var opacity: Double = 0.5
	
    var body: some View {
		if isActive {
			HomeView()
		} else {
			VStack (spacing: 20) {
				Image("splash")
					.resizable()
					.scaledToFit()
					.frame(width: 150, height: 150)
				
				Text("한국의 멸종 위기 동물들")
					.font(.largeTitle)
					.foregroundColor(.accentColor.opacity(0.8))
					.fontWeight(.heavy)
			}  //: VSTACK
        
			.scaleEffect(size) // 처음 시작 사이즈 약간 작게
			.opacity(opacity) // 투명
			.onAppear { // 화면이 시작될때 애니메이션 추가
				withAnimation(.easeInOut(duration: 1.5)) {
					size = 1.0
					opacity = 1.0
					
					// 3초 후에 HomeView 로 이동하기
                    // 3초 딜레이를 주는 방법
					DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
						isActive = true // 값에 따라 화면이 변함 State라
					}
				}
			}
		}
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
