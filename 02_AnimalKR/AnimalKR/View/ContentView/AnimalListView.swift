//
//  AnimalListView.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/24.
//

import SwiftUI

struct AnimalListView: View {
	
	// property
    // 고정 값으로 들어올거라 딱히 프로퍼티 래퍼 필요 없음
	let animal: Animal
	
    var body: some View {
		HStack (spacing: 20) {
			Image(animal.image)
				.resizable()
				.scaledToFill()
				.frame(width: 90, height: 90)
				.clipShape(RoundedRectangle(cornerRadius: 12)) // 약간 둥근 사각형 만큼 이미지 자르기
			
			VStack (spacing: 10) {
				Text(animal.name)
					.hLeading() // 앞쪽으로 붙게
					.font(.title)
					.foregroundColor(.accentColor)
				
				Text(animal.headline)
					.font(.footnote)
					.lineLimit(2) // 두줄 넘어가면 ...
					.padding(.trailing, 10)
			} //: VSTACK
		}  //: HSTACK
    }
}

struct AnimalListView_Previews: PreviewProvider {
    static var previews: some View {
		AnimalListView(animal: Animal.sampleAnimal)
        // 모델에 샘플 만들면 이렇게 편함 
    }
}
