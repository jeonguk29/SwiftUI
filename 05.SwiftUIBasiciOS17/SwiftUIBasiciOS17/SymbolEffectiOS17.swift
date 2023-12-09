//
//  SymbolEffectiOS17.swift
//  SwiftUIBasiciOS17
//
//  Created by Jacob Ko on 16/11/23.
//

import SwiftUI

// SymbolEffect 을 통해서 Symbol 에 animation 효과를 넣을 수 있습니다.

struct SymbolEffectiOS17: View {
	
	@State private var startAnimation: Bool = false
	
	var body: some View {
		List {
			Label(
				title: { Text("색 변형 - variableColor") },
				icon: {
					Image(systemName: "airplayaudio")
						.foregroundStyle(.mint)
						.symbolEffect(.variableColor) // 점차 색상이 깜빡임
				}
			)
			
			Label(
				title: { Text("경고 표시 알림 - Pulse") },
				icon: {
					Image(systemName: "airplayaudio.badge.exclamationmark")
						.foregroundStyle(.red, .mint) // 색을 다르게 표시해서 경고 표시 알림
						.symbolEffect(.pulse) // 바운스 일어나도록 
					
				}
			)
			
			Label(
				title: { Text("Start Button 눌르면 시작") },
				icon: {
					// Value 값이 변하면 Animation 시작
					Image(systemName: "lightbulb.max.fill")
						.foregroundStyle(.mint)
						.symbolEffect(.bounce, options: .repeating.repeat(2), value: startAnimation)
				}           // .repeating.repeat(2) 두번만 깜빡 하도록
			)
			
			Button("Start") {
				startAnimation.toggle()
			}
			.buttonStyle(.borderedProminent)
			
		}
		.font(.title)
		.listStyle(.plain)
		.listRowSpacing(60)
	}
}

#Preview {
	SymbolEffectiOS17()
}
