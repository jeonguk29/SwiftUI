//
//  TransitionBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/08/18.
//

import SwiftUI

struct TransitionBasic: View {
	
	// property
	@State var showTrasition: Bool = false
	
    var body: some View {
		ZStack(alignment: .bottom) {
			VStack {
				Button {
					withAnimation(.easeInOut) {
						showTrasition.toggle()
					}
				} label: {
					Text("Button")
				}
				
				Spacer()
			}
			
			if showTrasition {
				RoundedRectangle(cornerRadius: 30)
					.frame(height: UIScreen.main.bounds.height * 0.5) // 사용하는 디바이스가 다 달라서 해당 기기의 화면의 절반
					.opacity(showTrasition ? 1.0 : 0.0) // 투명도
				
				// 1번 move transition
					// .transition(.move(edge: .bottom))
				
				// 2번 opacity transition
                    //.transition(.opacity) // 투명도가 서서히 나타남
				
				// 3번 scale transition
                    //.transition(.scale)
				
				// 4번 asymmetric transtion - 시작점 끝나지점을 custom 정해주기 때문에 비대칭 transition
					.transition(.asymmetric(
						insertion: .move(edge: .leading),
						removal: .move(edge: .trailing)))
			}
		}
		.ignoresSafeArea(edges: .bottom) //SafeArea 바텀부분 지우기 
    }
}

struct TransitionBasic_Previews: PreviewProvider {
    static var previews: some View {
        TransitionBasic()
    }
}
