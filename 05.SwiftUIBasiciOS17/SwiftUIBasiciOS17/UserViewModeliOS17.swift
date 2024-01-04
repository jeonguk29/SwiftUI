//
//  UserViewModeliOS17.swift
//  SwiftUIBasiciOS17
//
//  Created by Jacob Ko on 16/11/23.
//

import Foundation
import Observation



// MARK: - 기존에 만들었던 ViewModel 방식
// 💁 ObservableObject를 채택하고 View에 State랑 연결하기 위해 @Published로 상태값을 저장한다음 사용했었음
class UserObservableObject: ObservableObject {
	let name: String = "vm1"
	@Published var number: Int = 0 // Published 상태값 저장 할때
	@Published var isClick: Bool = false
}


// MARK: - iOS17 부터는 @Obsevavle 사용하기
@Observable // 프레임 워크라 import Observation 해줘야 사용가능 
// 💁 @Published를 넣지 않아도 자동으로 연결됨 단순 변수 선언만 해주면 끝 
class UserObservableMacro {
	let name: String = "vm2"
	var number: Int = 0
	var isClick: Bool = false
}
