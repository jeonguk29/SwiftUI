//
//  IOSDeviceViewModel.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/11/17.
//

import Foundation

class IOSDeviceViewModel: ObservableObject { // 뷰쪽에 Published 로 정의된 데이터의 상태를 전달하기 위해 ObservableObject를 채택
	
	// property
	@Published var iOSDeviceArray: [IOSDeviceModel] = [] // 뷰모델이 데이터를 가짐 
	
	// init
	init() {
		getData()
	}
	
	
	// function
	func getData() {
		
		// 값 선언
		let iphone = IOSDeviceModel(name: "아이폰")
		let iPad = IOSDeviceModel(name: "아이패드")
		let iMac = IOSDeviceModel(name: "아이맥")
		let appleWatch = IOSDeviceModel(name: "애플워치")
		
		// 값 넣기
		self.iOSDeviceArray.append(iphone)
		self.iOSDeviceArray.append(iPad)
		self.iOSDeviceArray.append(iMac)
		self.iOSDeviceArray.append(appleWatch)
		
	}
}
