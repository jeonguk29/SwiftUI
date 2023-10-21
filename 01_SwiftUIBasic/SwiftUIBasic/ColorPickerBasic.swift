//
//  ColorPickerBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/09/01.
//

import SwiftUI

struct ColorPickerBasic: View {
	// property
	@State var backgroundColor: Color = .green
	
    var body: some View {
		ZStack {
			// background
			backgroundColor.ignoresSafeArea()
			
			ColorPicker(selection: $backgroundColor, supportsOpacity: false) { // supportsOpacity: true 면 투명도 까지 선택 가능
				Text("원하는 색을 고르세요")
				
			}
			.padding()
			.background(Color.black)
			.cornerRadius(10)
			.foregroundColor(.white)
			.font(.headline)
			.padding(50)
		} // : ZStack
    }
}

struct ColorPickerBasic_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerBasic()
    }
}
