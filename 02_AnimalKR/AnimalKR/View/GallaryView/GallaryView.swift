//
//  GallaryView.swift
//  AnimalKR
//
//  Created by Jacob Ko on 2022/12/23.
//

import SwiftUI

struct GallaryView: View {
	
	@ObservedObject var vm: AnimalViewModel
	
    var body: some View {
		NavigationView {
			ScrollView(.vertical, showsIndicators: false) {
				VStack (spacing: 30) {
					
					// 1. Image
					Image(vm.selectedAnimal)
						.resizable()
						.scaledToFill()
						.frame(width: 250, height: 250)
						.clipShape(Circle())
						.overlay(
							Circle()
								.stroke(Color.accentColor, lineWidth: 5)
						)
					
					
					// 2. Slider
					Slider(value: $vm.gridColumn, in: 2...4, step: 1)
						.padding(0)
						.onChange(of: vm.gridColumn) { value in
                            
                            // 자연스럽게 이동하도록 애니메이션 추가
							withAnimation(Animation.easeInOut(duration: 1.0)) {
								vm.gridSwitch() // 슬라이드 움직이면 호출해서 열을 조절
							}
						}
					
					// 3. Grid
					LazyVGrid(columns: vm.gridLayout, spacing: 20) {
						ForEach(vm.animals) { animal in
							Image(animal.image)
								.resizable()
								.scaledToFill()
								.frame(width: 80, height: 80)
								.clipShape(Circle())
								.overlay(Circle().stroke(Color.white, lineWidth: 1))
								.onTapGesture {
                                    // 선택시 자연스럽게 동물 이미지 변환 되도록 애니메이션 추가
									withAnimation(Animation.spring()) {
										vm.selectedAnimal = animal.image
									}
								}
						} //: LOOP
					} //: GRID
					
				} //: VSTACK
				.padding()
				
			} //: SCROLL
			.navigationBarTitle("겔러리", displayMode: .inline)
		} //: NAVIGATION
    }
}

struct GallaryView_Previews: PreviewProvider {
    static var previews: some View {
        GallaryView(vm: AnimalViewModel())
    }
}
