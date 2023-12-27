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
	@Published var selectedAnimal: String = "tiger"
	
	
	// GridLayout
	@Published var gridLayout: [GridItem] = [GridItem(.flexible())]
	@Published var gridColumn: Double = 4.0
	
	// init
	init() {
		gridSwitch()
	}
	
	// func
	func gridSwitch() {
		gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
	}
}
