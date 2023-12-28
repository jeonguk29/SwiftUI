//
//  AnimalViewModel.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/24.
//

import SwiftUI

class AnimalViewModel: ObservableObject {
	// property
	@Published var animals: [Animal] = Bundle.main.decode("animals.json")
	@Published var coverImages: [CoverImage] = Bundle.main.decode("covers.json")
	@Published var videos: [Video] = Bundle.main.decode("videos.json")
	
	// GallaryView
	@Published var selectedAnimal: String = "tiger" // 초기 선택 동물 값을 지정
	
	
	// GridLayout
	@Published var gridLayout: [GridItem] = [GridItem(.flexible())]
    // .flexible()은 그리드 항목의 크기를 유연하게 조정하여 그리드의 열과 행의 크기를 균일하게 배치합니다.
	@Published var gridColumn: Double = 4.0 // 4열이 되도록
	
	// init
	init() {
		gridSwitch() //초기 값으로 4.0이 설정되어 있으며, 이는 4열로 그리드를 구성하도록 나타냅니다.
    }
	
	// func
	func gridSwitch() {
        //
		gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
        // gridSwitch()는 그리드 레이아웃을 변경하는 메서드입니다. gridLayout을 gridColumn의 값에 따라 업데이트합니다. count 매개변수에는 gridColumn 값을 Int로 변환한 값을 전달하여 해당 열의 수에 맞게 GridItem 배열을 생성합니다. 즉 열을 조절
        
        /*
         이렇게 설정된 gridLayout과 gridColumn을 사용하여 SwiftUI에서 그리드 레이아웃을 구성할 수 있습니다. gridLayout을 해당 뷰의 그리드 레이아웃으로 설정하고, 그리드 항목을 필요한 대로 추가하거나 제거할 수 있습니다. gridColumn 값을 변경하면 그리드의 열의 수가 자동으로 업데이트됩니다.
         */
	}
}
