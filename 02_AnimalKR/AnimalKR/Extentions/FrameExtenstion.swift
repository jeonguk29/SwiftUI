//
//  FrameExtenstion.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/23.
//

import SwiftUI

// MARK: - ResponsiveScreen


/*
 기기마다 다른 화면의 크기를 가지고 있기 때문에 이미지를 어느정도 보이게 할건지 등
 Extenstion을 통해 미리 정의
 */

extension CGFloat {
	static let screenWidth = UIScreen.main.bounds.width // 시스템이 알아서 지금 해당 휴대폰의 너비 값을 가져옴 
	static let screenHeight = UIScreen.main.bounds.height
}

// MARK: - Frame Modifier

extension View {
	// Vertical Center
	func vCenter() -> some View {
		self.frame(maxHeight: .infinity, alignment: .center)
	}
	
	// Vertical Top
	func vTop() -> some View {
		self.frame(maxHeight: .infinity, alignment: .top)
	}
	
	// Vertical Bottom
	func vBottom() -> some View {
		self.frame(maxHeight: .infinity, alignment: .bottom)
	}
	
	// Horizontal Center
	func hCenter() -> some View {
		self.frame(maxWidth: .infinity, alignment: .center)
	}
	
	// Horizontal Leading
	func hLeading() -> some View {
		self.frame(maxWidth: .infinity, alignment: .leading)
	}
	
	// Horizontal Trailing
	func hTrailing() -> some View {
		self.frame(maxWidth: .infinity, alignment: .trailing)
	}
}

/*
 .hLeding()
 .vTop()  이렇게 하면 11시 방향으로 위치하게됨
 
 이렇게 요소를 만들어 놓으면 쉽게 배치를 할 수 있게 됨 코드양을 확 줄여줌 
 */
