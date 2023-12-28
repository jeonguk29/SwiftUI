//
//  DetailFact.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/24.
//

import SwiftUI

struct DetailFact: View {
	
	// property
	let animal: Animal
	
    var body: some View {
        /*
         GroupBox는 SwiftUI에서 사용되는 뷰 컨테이너입니다. 이 컨테이너는 다른 뷰를 그룹화할 수 있으며, 시각적으로 구분되는 경계를 생성합니다. 주로 관련된 뷰를 함께 묶어서 시각적으로 구분하고, 레이아웃을 관리하는 데 사용됩니다.
         */
		GroupBox {
			TabView {
				ForEach(animal.fact, id: \.self) { item in
					Text(item)
				}
			}  //: TAB
			.tabViewStyle(.page)
			.frame(minHeight: 148, idealHeight: 168, maxHeight: 180) // 이렇게 해주면 해상도가 각 폰마다 달라짐 
            /*
             GroupBox가 차지하는 공간의 크기를 정의하는 부분입니다. SwiftUI에서 View의 크기는 minHeight, idealHeight, maxHeight로 정의할 수 있습니다. minHeight는 뷰의 최소 높이, idealHeight는 뷰의 이상적인 높이, maxHeight는 뷰의 최대 높이를 나타냅니다. 이렇게 설정하면, 뷰가 다양한 기기나 해상도에서 일관된 크기로 보여질 수 있습니다.

             따라서, 주어진 코드에서 GroupBox는 TabView 내부에 있는 다양한 동물의 사실을 보여주는 Text 뷰들을 그룹화하고, frame 속성을 사용하여 뷰의 크기를 제한하고 있습니다.
             */
		} //:GROUPBOX
    }
}

struct DetailFact_Previews: PreviewProvider {
    static var previews: some View {
		DetailFact(animal: Animal.sampleAnimal)
    }
}
