//
//  FruitViewModel.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/11/04.
//

import Foundation

// ObservableObject를 채택해야 객체화를 해서 해당 뷰에 넘겨줄수 있고, 넘겨 받는게 가능 하다고 했음
class FruitViewModel: ObservableObject {
	// property (ViewModel에서는 @Published를 붙여줌)
	
	// publised wrapper 는 @State 와 비슷하게 상태값을 선언하는데, class 안에서는 @Published 를 사용한다는 점이 다름니다.
	// @Published 는 Fruit 배열의 값이 View 에서 변경이 되면 FruitViewModel 에서 새로운 변경사항을 알아차려서 변경 한다는 점입니다.
	@Published var fruitArray: [FruitModel] = []
	@Published var isLoading: Bool = false
	
	// init
	init() {
		getFruit() // 뷰 모델 실행될때 배열에 값 추가, onAppear보다 init사용해서 초기화 하는게 좀더 확실하게 뷰에 표시할수 있음 
	}
	
	
	// function
	
	// Fruit 생성하고 Array 에 추가 하는 함수
	func getFruit() {
		
		// fruit 의 각각의 값 선언
		let fruit1 = FruitModel(name: "딸기", count: 1)
		let fruit2 = FruitModel(name: "사과", count: 2)
		let fruit3 = FruitModel(name: "바나나", count: 80)
		
		// 3초 딜레이후, fruitArray 에 선언된 값을 집어넣기
		isLoading = true
		DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
			self.fruitArray.append(fruit1)
			self.fruitArray.append(fruit2)
			self.fruitArray.append(fruit3)
			self.isLoading = false
		}
	}
	
	// fruitArray 에서 값을 삭제하는 logic
	func deleteFruit(index: IndexSet) {
		fruitArray.remove(atOffsets: index)
	}
	
}
